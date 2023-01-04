// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_attach_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageAttachFile _$MessageAttachFileFromJson(Map<String, dynamic> json) =>
    MessageAttachFile(
      createBy: json['create_by'] as String?,
      content: json['content'] as String?,
      id: json['id'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$MessageAttachFileToJson(MessageAttachFile instance) =>
    <String, dynamic>{
      'create_by': instance.createBy,
      'content': instance.content,
      'id': instance.id,
      'modified_date': instance.modifiedDate,
    };

MessageAttachFiles _$MessageAttachFilesFromJson(Map<String, dynamic> json) =>
    MessageAttachFiles(
      (json['content'] as List<dynamic>?)
              ?.map(
                  (e) => MessageAttachFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$MessageAttachFilesToJson(MessageAttachFiles instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
