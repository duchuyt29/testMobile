// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_create_involve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCreateInvolve _$ActivityCreateInvolveFromJson(
        Map<String, dynamic> json) =>
    ActivityCreateInvolve(
      role: json['role'] as String?,
      involveType: json['involveType'] as String? ?? 'user',
      involveIds: (json['involveIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ActivityCreateInvolveToJson(
    ActivityCreateInvolve instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  val['involveType'] = instance.involveType;
  writeNotNull('involveIds', instance.involveIds);
  return val;
}
