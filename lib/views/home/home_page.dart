import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:graph_ql/cubit/cubit/country_cubit.dart';

import '../detail_country/detail_country_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  BlocBuilder<CountryCubit, CountryState> myBody() {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          return const Center(
            child: Text("SomeThing Went Wrong"),
          );
        } else if (state.status == FormzStatus.submissionInProgress) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state.status == FormzStatus.submissionSuccess) {
          return ListView.builder(
            itemCount: state.countriesInfo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    context.read<CountryCubit>().getDetailCountryInfoByCode(
                        code: state.countriesInfo[index].code);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailCountryScreen(),
                      ),
                    );
                  },
                  leading: Text(
                    state.countriesInfo[index].emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text(state.countriesInfo[index].name),
                  trailing: Text(state.countriesInfo[index].code),
                ),
              );
            },
          );
        } else {
          return const SizedBox(
            child: Text("Nothing Not Here"),
          );
        }
      },
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("Hone Screen"),
      centerTitle: true,
    );
  }
}
