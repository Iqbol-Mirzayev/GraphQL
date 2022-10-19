import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../cubit/cubit/country_cubit.dart';

class DetailCountryScreen extends StatelessWidget {
  const DetailCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
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
                padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.detailInfoCountry!.emoji,
                            style: const TextStyle(fontSize: 100),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.detailInfoCountry!.name,
                                  style: const TextStyle(fontSize: 25),
                                  maxLines: 2,
                                ),
                                Text(
                                  state.detailInfoCountry!.capital,
                                  style: const TextStyle(fontSize: 25),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Currency:",
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                state.detailInfoCountry!.currency,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: const Text("Languages"),
                            children: List.generate(
                              state.detailInfoCountry!.countryLanguages.length,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(state.detailInfoCountry!
                                    .countryLanguages[index].name),
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
      ),
    );
  }
}