import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../cubit/cubit/country_cubit.dart';

class DetailCountryScreen extends StatelessWidget {
  const DetailCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: Colors.white,
      body: myBody(),
    );
  }

  SafeArea myBody() {
    return SafeArea(
      child: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.status == FormzStatus.submissionFailure) {
            return const Center(
              child: Text("Error occured"),
            );
          } else if (state.status == FormzStatus.submissionSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.detailInfoCountry!.emoji,
                          style: const TextStyle(fontSize: 70),
                        ),
                        Text(
                          state.detailInfoCountry!.name,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Currency  :  ",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              state.detailInfoCountry!.currency,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            "Languages",
                            style: TextStyle(fontSize: 20),
                          ),
                          children: List.generate(
                            state.detailInfoCountry!.countryLanguages.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                state.detailInfoCountry!
                                    .countryLanguages[index].name,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            "Capital",
                            style: TextStyle(fontSize: 20),
                          ),
                          children: List.generate(
                            state.detailInfoCountry!.countryLanguages.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                state.detailInfoCountry!.capital,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("Detail Data"),
      centerTitle: true,
    );
  }
}
