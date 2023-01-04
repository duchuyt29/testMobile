import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

import '../../../crm_api/models/employee/employee_info.dart';
import '../base_models.dart';
import 'employee_info_hcm.dart';
import 'user_mapping.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String? id;
  int? companyId;
  dynamic keycloakId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? fullName;
  String? avatar;
  dynamic signatureImage;
  dynamic signatureText;
  String? phone;
  DateTime? birthDate;
  String? locale;
  String? state;
  @JsonKey(fromJson: _convertStatus)
  bool? status;
  bool? activeCert;
  dynamic certs;
  dynamic orgs;

  @JsonKey(ignore: true)
  bool isLoadedEmployeeInfo = false;

  // Lấy thông tin employee từ CRM
  @JsonKey(ignore: true)
  EmployeeInfo? employeeInfo;

  // Lấy thông tin employee từ HCM cũ
  @JsonKey(ignore: true)
  UserMapping? userMapping;
  @JsonKey(ignore: true)
  EmployeeInfoHCM? employeeInfoHCM;

  UserInfo({
    this.id,
    this.companyId,
    this.keycloakId,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.fullName,
    this.avatar,
    this.signatureImage,
    this.signatureText,
    this.phone,
    this.birthDate,
    this.locale,
    this.state,
    this.status,
    this.activeCert,
    this.certs,
    this.orgs,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    final userInfo = _$UserInfoFromJson(json);
    userInfo.birthDate ??= json['birth_date'] == null
        ? null
        : DateTime.parse(json['birth_date'] as String);

    userInfo.firstName ??=
        json['first_name'] == null ? null : json['first_name'] as String?;

    userInfo.middleName ??=
        json['middle_name'] == null ? null : json['middle_name'] as String?;

    userInfo.lastName ??=
        json['last_name'] == null ? null : json['last_name'] as String?;

    if (userInfo.fullName == null || userInfo.fullName!.isEmpty) {
      var name = userInfo.lastName ?? '';
      if (userInfo.middleName?.isNotEmpty ?? false) {
        name = name.isEmpty
            ? userInfo.middleName!
            : '$name ${userInfo.middleName!}';
      }

      if (userInfo.firstName?.isNotEmpty ?? false) {
        name =
            name.isEmpty ? userInfo.firstName! : '$name ${userInfo.firstName!}';
      }
      userInfo.fullName = name;
    }
    return userInfo;
  }

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  void updateInfo(UserInfo? userInfo) {}

  ChatUser getChatUser() {
    return ChatUser(
      id: id ?? '',
      profileImage: getAvatar(),
      firstName: getName(),
    );
  }

  String getAvatar() {
    return PathService.imagePath(avatar ??
        employeeInfoHCM?.avatar ??
        employeeInfo?.employeeAvatarId ??
        userMapping?.avatar);
  }

  String getName() {
    final employeeInfoFullName = employeeInfo?.getFullName() ?? '';
    if (employeeInfoFullName.isNotEmpty) {
      return employeeInfoFullName;
    }
    if (employeeInfoHCM?.fullName?.isNotEmpty ?? false) {
      return employeeInfoHCM?.fullName ?? '';
    }
    if (userMapping?.fullName?.isNotEmpty ?? false) {
      return userMapping?.fullName ?? '';
    }
    return fullName ?? '';
  }

  String getPhone() {
    if (employeeInfo?.employeePhone?.isNotEmpty ?? false) {
      return employeeInfo?.employeePhone ?? '';
    }
    if (employeeInfoHCM?.mobile?.isNotEmpty ?? false) {
      return employeeInfoHCM?.mobile ?? '';
    }
    return phone ?? '';
  }

  DateTime? getBirthday() {
    // if (employeeInfo?.birthDate != null) {
    //   return employeeInfo?.birthDate;
    // }
    return birthDate;
  }

  String getEmail() {
    if (employeeInfo?.employeeEmail?.isNotEmpty ?? false) {
      return employeeInfo?.employeeEmail ?? '';
    }
    if (employeeInfoHCM?.email?.isNotEmpty ?? false) {
      return employeeInfoHCM?.email ?? '';
    }
    if (userMapping?.workEmail?.isNotEmpty ?? false) {
      return userMapping?.workEmail ?? '';
    }
    return email ?? '';
  }

// CreateConversationRequest? getCreateConversationRequest() {
//   if (id == null || AppDataGlobal.userConfig?.id == null) {
//     return null;
//   }
//   final involves = <String, CreateConversationUser>{
//     AppDataGlobal.userConfig!.id!:
//         CreateConversationUser(AppDataGlobal.userConfig!.getName()),
//     id!: CreateConversationUser(getName()),
//   };
//   return CreateConversationRequest(Conversation.TYPE_PRIVATE, involves);
// }
}

@JsonSerializable()
class UserInfos extends BaseModels {
  @JsonKey(defaultValue: [])
  List<UserInfo> content;

  UserInfos(this.content);

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    return _$UserInfosFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UserInfosToJson(this);
}

bool? _convertStatus(dynamic status) {
  if (status == null) {
    return null;
  } else if (status is bool) {
    return status;
  } else if (status is int) {
    return status == 1;
  } else {
    return null;
  }
}
