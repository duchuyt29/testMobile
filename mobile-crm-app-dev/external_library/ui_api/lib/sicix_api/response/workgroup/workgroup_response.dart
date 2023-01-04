import 'package:json_annotation/json_annotation.dart';

import '../../models/workgroup/workgroup.dart';
import '../base_response.dart';

part 'workgroup_response.g.dart';

@JsonSerializable()
class WorkgroupResponse extends BaseResponse {
  Workgroup? data;

  WorkgroupResponse(this.data) : super(false);

  factory WorkgroupResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkgroupResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WorkgroupResponseToJson(this);
}
