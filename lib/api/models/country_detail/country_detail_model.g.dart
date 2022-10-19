// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDetailModel _$CountryDetailModelFromJson(Map<String, dynamic> json) =>
    CountryDetailModel(
      name: json['name'] as String? ?? '',
      native: json['native'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      countryLanguages: (json['languages'] as List<dynamic>)
          .map((e) => CountryLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );