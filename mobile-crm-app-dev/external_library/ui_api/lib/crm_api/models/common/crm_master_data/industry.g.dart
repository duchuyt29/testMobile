// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry _$IndustryFromJson(Map<String, dynamic> json) => Industry(
      industryName: json['industryName'] as String?,
      id: json['id'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$IndustryToJson(Industry instance) => <String, dynamic>{
      'industryName': instance.industryName,
      'id': instance.id,
      'status': instance.status,
    };
