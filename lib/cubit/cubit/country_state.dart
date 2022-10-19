part of 'country_cubit.dart';

@immutable
class CountryState extends Equatable {
  const CountryState({
    required this.countriesInfo,
    this.status = FormzStatus.pure,
    this.detailInfoCountry,
    this.errorMessage = '',
  });
  final FormzStatus status;
  final List<CountryCodeModel> countriesInfo;
  final CountryDetailModel? detailInfoCountry;
  final String errorMessage;

  CountryState copyWith({
    FormzStatus? status,
    List<CountryCodeModel>? countriesInfo,
    CountryDetailModel? detailInfoCountry,
    String? errorMessage,
  }) =>
      CountryState(
        countriesInfo: countriesInfo ?? this.countriesInfo,
        status: status ?? this.status,
        detailInfoCountry: detailInfoCountry ?? this.detailInfoCountry,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<dynamic> get props =>
      [countriesInfo, detailInfoCountry, status, errorMessage];
}