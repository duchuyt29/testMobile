import 'package:json_annotation/json_annotation.dart';

import '../../models/common/district.dart';
import '../base_response.dart';

part 'district_response.g.dart';

@JsonSerializable()
class DistrictResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<District>? data;
  DistrictResponse({this.data}) : super(false);

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
