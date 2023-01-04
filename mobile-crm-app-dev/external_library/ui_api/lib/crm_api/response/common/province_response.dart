import 'package:json_annotation/json_annotation.dart';

import '../../models/common/province.dart';
import '../base_response.dart';

part 'province_response.g.dart';

@JsonSerializable()
class ProvinceResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<Province>? data;
  ProvinceResponse({this.data}) : super(false);

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
