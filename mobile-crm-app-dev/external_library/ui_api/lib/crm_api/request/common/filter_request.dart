import 'package:json_annotation/json_annotation.dart';

part 'filter_request.g.dart';

@JsonSerializable()
class FilterRequest {
  int? genderId;
  String? countryId;
  int? provinceId;
  String? provinceName;
  int? districtId;
  String? districtName;
  int? wardId;
  String? wardName;

  FilterRequest({
    this.genderId = 0,
    this.countryId = '',
    this.provinceId = 0,
    this.provinceName,
    this.districtId = 0,
    this.districtName,
    this.wardId = 0,
    this.wardName,
  });

  factory FilterRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FilterRequestToJson(this);
}
