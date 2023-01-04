// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentItem _$AttachmentItemFromJson(Map<String, dynamic> json) =>
    AttachmentItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      application: json['application'] as String?,
      description: json['description'],
      versionNo: json['versionNo'],
      changes: json['changes'] as int?,
      refType: json['refType'] as String?,
      refId: json['refId'] as String?,
      businessRole: json['businessRole'],
      attributes: json['attributes'],
      file: json['file'] == null
          ? null
          : AttachmentFileItem.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttachmentItemToJson(AttachmentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'application': instance.application,
      'description': instance.description,
      'versionNo': instance.versionNo,
      'changes': instance.changes,
      'refType': instance.refType,
      'refId': instance.refId,
      'businessRole': instance.businessRole,
      'attributes': instance.attributes,
      'file': instance.file,
    };
