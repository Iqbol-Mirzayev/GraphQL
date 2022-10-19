// Example data from backend.
// "country": {
//             "name": "United States",
//             "native": "United States",
//             "capital": "Washington D.C.",
//             "emoji": "🇺🇸",
//             "currency": "USD,USN,USS",
//             "languages": [
//                 {
//                     "code": "en",
//                     "name": "English"
//                 }
//             ]
//         }
import 'package:json_annotation/json_annotation.dart';

import 'country_language/country_language_model.dart';
part 'country_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class CountryDetailModel {
  const CountryDetailModel({
    required this.name,
    required this.native,
    required this.capital,
    required this.emoji,
    required this.currency,
    required this.countryLanguages,
  });

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailModelFromJson(json);

  @JsonKey(defaultValue: "", name: 'name')
  final String name;

  @JsonKey(defaultValue: "", name: 'native')
  final String native;

  @JsonKey(defaultValue: "", name: 'capital')
  final String capital;

  @JsonKey(defaultValue: "", name: 'emoji')
  final String emoji;

  @JsonKey(defaultValue: "", name: 'currency')
  final String currency;

  @JsonKey(name: 'languages')
  final List<CountryLanguageModel> countryLanguages;
}