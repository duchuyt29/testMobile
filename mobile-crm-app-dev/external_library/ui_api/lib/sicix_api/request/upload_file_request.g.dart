// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileRequest _$UploadFileRequestFromJson(Map<String, dynamic> json) =>
    UploadFileRequest(
      application: json['application'] as String?,
      refType: json['refType'] as String?,
      refId: json['refId'] as String?,
    );

Map<String, dynamic> _$UploadFileRequestToJson(UploadFileRequest instance) =>
    <String, dynamic>{
      'application': instance.application,
      'refType': instance.refType,
      'refId': instance.refId,
    };
