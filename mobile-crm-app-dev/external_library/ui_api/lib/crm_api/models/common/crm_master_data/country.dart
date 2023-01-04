import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  static final vietnam = Country(id: 'VN', countryName: 'VIỆT NAM');

  String? id;
  String? countryName;

  Country({this.id, this.countryName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return _$CountryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
