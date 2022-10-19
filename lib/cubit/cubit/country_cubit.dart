import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:graphql/client.dart';

import '../../api/country_api_client.dart';
import '../../api/models/models.dart';


part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit({required CountryApiClient countryApiClient})
      : _countryApiClient = countryApiClient,
        super(const CountryState(countriesInfo: []));

  final CountryApiClient _countryApiClient;

  void getCountriesInfo() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var countryInfos = await _countryApiClient.getCountryInfos();
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          countriesInfo: countryInfos,
        ),
      );
    } on GraphQLError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void getDetailCountryInfoByCode({required String code}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var countryDetailInfo =
          await _countryApiClient.getDetailCounryInfoByCode(code: code);
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          detailInfoCountry: countryDetailInfo,
        ),
      );
    } on GraphQLError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}