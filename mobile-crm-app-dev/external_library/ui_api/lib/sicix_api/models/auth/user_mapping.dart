import 'package:json_annotation/json_annotation.dart';

part 'user_mapping.g.dart';

@JsonSerializable()
class UserMapping {
  String? orgName;
  String? gender;
  dynamic level;
  String? workEmail;
  String? fullName;
  int? id;
  String? avatar;
  String? position;
  String? empNo;
  String? title;
  int? orgId;
  int? status;

  UserMapping({
    this.orgName,
    this.gender,
    this.level,
    this.workEmail,
    this.fullName,
    this.id,
    this.avatar,
    this.position,
    this.empNo,
    this.title,
    this.orgId,
    this.status,
  });

  factory UserMapping.fromJson(Map<String, dynamic> json) {
    return _$UserMappingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserMappingToJson(this);
}
