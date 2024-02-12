import 'package:coding_challenge/models/country.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax_residence.g.dart';

@JsonSerializable()
class TaxResidence {
  final String id;

  @JsonKey(name: 'country')
  final String countryCode;

  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  late final Country country;

  get countryName => country.label;

  TaxResidence({
    required this.id,
    required this.countryCode,
  }) {
    country = Country.fromCode(countryCode);
  }

  TaxResidence copyWith({
    String? id,
    String? countryCode,
  }) {
    return TaxResidence(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  factory TaxResidence.fromJson(Map<String, dynamic> json) =>
      _$TaxResidenceFromJson(json);

  Map<String, dynamic> toJson() => _$TaxResidenceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxResidence &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          countryCode == other.countryCode;

  @override
  int get hashCode => id.hashCode ^ countryCode.hashCode;
}
