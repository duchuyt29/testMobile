// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_file_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentFileItem _$AttachmentFileItemFromJson(Map<String, dynamic> json) =>
    AttachmentFileItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createDate: json['createDate'] as String?,
      contentType: json['contentType'] as String?,
      length: json['length'] as int?,
      createBy: json['createBy'] == null
          ? null
          : User.fromJson(json['createBy'] as Map<String, dynamic>),
      ref: json['ref'] as String?,
    );

Map<String, dynamic> _$AttachmentFileItemToJson(AttachmentFileItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate,
      'contentType': instance.contentType,
      'length': instance.length,
      'createBy': instance.createBy,
      'ref': instance.ref,
    };
