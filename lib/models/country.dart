import 'package:coding_challenge/shared/countries_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  static Iterable<Country> availableCountries = CountriesConstants
      .countryCurrencyMap.keys
      .map((code) => Country.fromCode(code));

  @JsonKey(name: 'country')
  final String code;

  final String label;

  Country({
    required this.code,
    required this.label,
  });

  //todo: check errors
  factory Country.fromCode(String code) {
    return Country(
        code: code,
        label: CountriesConstants.countryCurrencyMap[code]!['countryName']!);
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
