import 'package:json_annotation/json_annotation.dart';

part 'avatar_model.g.dart';

@JsonSerializable()
class AvatarModel {
  DateTime? createDate;
  DateTime? modifiedDate;
  int? version;
  int? status;
  int? companyId;
  String? createBy;
  String? updateBy;
  String? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? avatar;
  String? state;
  String? locale;
  String? fullName;

  AvatarModel({
    this.createDate,
    this.modifiedDate,
    this.version,
    this.status,
    this.companyId,
    this.createBy,
    this.updateBy,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.avatar,
    this.state,
    this.locale,
    this.fullName,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}
