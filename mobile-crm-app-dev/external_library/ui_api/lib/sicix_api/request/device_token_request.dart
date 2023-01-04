import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

part 'device_token_request.g.dart';

@JsonSerializable()
class DeviceTokenRequest {
  final String deviceToken;
  final String deviceId;
  final String deviceOS;
  final String osVersion;
  final String deviceName;
  final String appVersion;

  DeviceTokenRequest({
    required this.deviceToken,
    required this.deviceId,
    required this.deviceOS,
    required this.osVersion,
    required this.deviceName,
    required this.appVersion,
  });

  factory DeviceTokenRequest.request() {
    return DeviceTokenRequest(
      deviceToken: AppDataGlobal.firebaseToken,
      deviceId: AppDataGlobal.deviceId,
      deviceOS: AppDataGlobal.deviceOS,
      osVersion: AppDataGlobal.osVersion,
      deviceName: AppDataGlobal.deviceName,
      appVersion: AppDataGlobal.appVersion,
    );
  }

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenRequestToJson(this);
}
