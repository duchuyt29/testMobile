import 'package:json_annotation/json_annotation.dart';

import '../../models/common/ward.dart';
import '../base_response.dart';

part 'ward_response.g.dart';

@JsonSerializable()
class WardResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<Ward>? data;
  WardResponse({this.data}) : super(false);

  factory WardResponse.fromJson(Map<String, dynamic> json) =>
      _$WardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WardResponseToJson(this);
}
