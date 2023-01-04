// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_checkin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCheckinRequest _$ActivityCheckinRequestFromJson(
        Map<String, dynamic> json) =>
    ActivityCheckinRequest(
      id: json['id'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ActivityCheckinRequestToJson(
        ActivityCheckinRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
