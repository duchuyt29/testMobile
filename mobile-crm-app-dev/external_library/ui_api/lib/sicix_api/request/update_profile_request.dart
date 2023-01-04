import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  int? companyId;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;

  @JsonKey(toJson: _birthDateToJson)
  DateTime? birthDate;

  UpdateProfileRequest({
    this.companyId,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.phone,
    this.birthDate,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);

  static String _birthDateToJson(DateTime? birthDate) {
    // return birthDate?.toLocal().toIso8601String() ?? '';
    return DateUtil.formatDatetimeToString(birthDate?.toUtc(),
        type: DateUtil.API_TYPE);
  }
}
