import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';
import 'package:sicix/shared/utils/app_util.dart';

import 'company.dart';
import 'configs.dart';
import 'group.dart';
import 'last_company.dart';
import 'main_group.dart';
import 'menu_actions.dart';
import 'menu_allow.dart';

part 'user_config.g.dart';

@JsonSerializable()
class UserConfig {
  final String? lastName;
  final Configs? configs;
  final List<Group>? groups;
  final String? avatar;
  final String? locale;
  final String? firstName;
  final int? companyId;
  final List<Company>? companies;
  final LastCompany? lastCompany;
  final List<MainGroup>? mainGroups;
  final dynamic signatureImage;
  final String? middleName;
  final String? id;
  final MenuActions? menuActions;
  final String? email;
  final String? username;
  final bool? status;
  final List<MenuAllow>? menuAllow;

  const UserConfig({
    this.lastName,
    this.configs,
    this.groups,
    this.avatar,
    this.locale,
    this.firstName,
    this.companyId,
    this.companies,
    this.lastCompany,
    this.mainGroups,
    this.signatureImage,
    this.middleName,
    this.id,
    this.menuActions,
    this.email,
    this.username,
    this.status,
    this.menuAllow,
  });

  factory UserConfig.fromJson(Map<String, dynamic> json) {
    return _$UserConfigFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserConfigToJson(this);

  Company? getLastCompany() {
    return companies
        ?.firstWhereOrNull((element) => element.id == configs?.lastCompanyId);
  }

  String getFullName() {
    // var fullname = firstName ?? '';
    // if (middleName?.isNotEmpty ?? false) {
    //   fullname = fullname.isEmpty ? middleName! : '$fullname $middleName';
    // }
    // if (lastName?.isNotEmpty ?? false) {
    //   fullname = fullname.isEmpty ? lastName! : '$fullname $lastName';
    // }
    // return fullname;

    return AppUtil.cleanDuplicateWhitespace(
        '${firstName ?? ''} ${middleName ?? ''} ${lastCompany ?? ''}');
  }

  String getAvatar() {
    return PathService.imagePath(avatar);
  }

  String getName() {
    final fullname = getFullName();
    return fullname.isEmpty ? username ?? '' : fullname;
  }

  // ChatUser getChatUser() {
  //   return ChatUser(
  //     id: id ?? '',
  //     profileImage: getAvatar(),
  //     firstName: getFullName(),
  //   );
  // }
}
