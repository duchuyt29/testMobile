// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_involves.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityInvolves _$ActivityInvolvesFromJson(Map<String, dynamic> json) =>
    ActivityInvolves(
      role: json['role'] as String?,
      involveType: json['involveType'] as String?,
      involveIds: (json['involveIds'] as List<dynamic>?)
          ?.map((e) => InvolveIds.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyId: json['companyId'] as int?,
    );

Map<String, dynamic> _$ActivityInvolvesToJson(ActivityInvolves instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  writeNotNull('involveType', instance.involveType);
  writeNotNull('involveIds', instance.involveIds);
  writeNotNull('companyId', instance.companyId);
  return val;
}

InvolveIds _$InvolveIdsFromJson(Map<String, dynamic> json) => InvolveIds(
      avatar: json['avatar'] as String?,
      id: json['id'] as String?,
      companyId: json['companyId'] as int?,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      locale: json['locale'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$InvolveIdsToJson(InvolveIds instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar', instance.avatar);
  writeNotNull('id', instance.id);
  writeNotNull('companyId', instance.companyId);
  writeNotNull('username', instance.username);
  writeNotNull('fullName', instance.fullName);
  writeNotNull('locale', instance.locale);
  writeNotNull('status', instance.status);
  return val;
}
