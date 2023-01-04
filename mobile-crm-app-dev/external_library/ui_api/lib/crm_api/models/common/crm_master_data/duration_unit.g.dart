// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DurationUnit _$DurationUnitFromJson(Map<String, dynamic> json) => DurationUnit(
      durationUnitName: json['durationUnitName'] as String?,
      id: json['id'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DurationUnitToJson(DurationUnit instance) =>
    <String, dynamic>{
      'durationUnitName': instance.durationUnitName,
      'id': instance.id,
      'status': instance.status,
    };
