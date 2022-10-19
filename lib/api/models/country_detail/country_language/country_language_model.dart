// Example data from backend.
// {
//   "code": "en",
//   "name": "English"
// }
import 'package:json_annotation/json_annotation.dart';
part 'country_language_model.g.dart';

@JsonSerializable(createToJson: false)
class CountryLanguageModel {
  const CountryLanguageModel({
    required this.code,
    required this.name,
  });

  factory CountryLanguageModel.fromJson(Map<String, dynamic> json) => _$CountryLanguageModelFromJson(json);

  @JsonKey(defaultValue: "", name: 'code')
  final String code;
  @JsonKey(defaultValue: "", name: 'name')
  final String name;
}