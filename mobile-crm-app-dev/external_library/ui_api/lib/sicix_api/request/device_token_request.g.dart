// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceTokenRequest _$DeviceTokenRequestFromJson(Map<String, dynamic> json) =>
    DeviceTokenRequest(
      deviceToken: json['deviceToken'] as String,
      deviceId: json['deviceId'] as String,
      deviceOS: json['deviceOS'] as String,
      osVersion: json['osVersion'] as String,
      deviceName: json['deviceName'] as String,
      appVersion: json['appVersion'] as String,
    );

Map<String, dynamic> _$DeviceTokenRequestToJson(DeviceTokenRequest instance) =>
    <String, dynamic>{
      'deviceToken': instance.deviceToken,
      'deviceId': instance.deviceId,
      'deviceOS': instance.deviceOS,
      'osVersion': instance.osVersion,
      'deviceName': instance.deviceName,
      'appVersion': instance.appVersion,
    };
