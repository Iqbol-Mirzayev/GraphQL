// Example data from backend.
// {
//    "code": "AD",
//    "name": "Andorra",
//    "emoji": "🇦🇩"
// },
import 'package:json_annotation/json_annotation.dart';
part 'country_code_model.g.dart';

@JsonSerializable(createToJson: false)
class CountryCodeModel {
  const CountryCodeModel({
    required this.code,
    required this.emoji,
    required this.name,
  });

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => _$CountryCodeModelFromJson(json);

  @JsonKey(defaultValue: "", name: 'code')
  final String code;
  @JsonKey(defaultValue: "", name: 'name')
  final String name;
  @JsonKey(defaultValue: "", name: 'emoji')
  final String emoji;
}
// flutter packages pub run build_runner build --delete-conflicting-outputs