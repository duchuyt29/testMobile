import 'package:json_annotation/json_annotation.dart';

import 'workgroup_attributes.dart';

part 'workgroup.g.dart';

@JsonSerializable()
class Workgroup {
  String? createDate;
  String? modifiedDate;
  int? version;
  int? status;
  int? companyId;
  String? createBy;
  String? updateBy;
  int? id;
  int? groupId;
  dynamic publishType;
  WorkgroupAttributes? attributes;

  Workgroup({
    this.createDate,
    this.modifiedDate,
    this.version,
    this.status,
    this.companyId,
    this.createBy,
    this.updateBy,
    this.id,
    this.groupId,
    this.publishType,
    this.attributes,
  });

  factory Workgroup.fromJson(Map<String, dynamic> json) {
    return _$WorkgroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkgroupToJson(this);
}
