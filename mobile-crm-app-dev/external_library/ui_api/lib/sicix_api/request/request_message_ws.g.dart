// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_message_ws.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestMessageWS _$RequestMessageWSFromJson(Map<String, dynamic> json) =>
    RequestMessageWS(
      id: json['id'] as String?,
      convId: json['convId'] as int?,
      cid: json['cid'] as int?,
      createBy: json['create_by'] as String?,
      content: json['content'],
      quote: json['quote'],
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      preparedContent: (json['preparedContent'] as List<dynamic>?)
          ?.map((e) => PreparedContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      prepared: json['prepared'] as bool?,
      type: json['type'] as String?,
      quoteCreateDate: json['quote_create_date'] as String?,
    );

Map<String, dynamic> _$RequestMessageWSToJson(RequestMessageWS instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('convId', instance.convId);
  writeNotNull('cid', instance.cid);
  writeNotNull('content', instance.content);
  writeNotNull('quote', instance.quote);
  writeNotNull('create_by', instance.createBy);
  writeNotNull('createDate', _dateToString(instance.createDate));
  writeNotNull('preparedContent', instance.preparedContent);
  writeNotNull('prepared', instance.prepared);
  writeNotNull('type', instance.type);
  writeNotNull('quote_create_date', instance.quoteCreateDate);
  return val;
}

PreparedContent _$PreparedContentFromJson(Map<String, dynamic> json) =>
    PreparedContent(
      json['content'] as String,
    );

Map<String, dynamic> _$PreparedContentToJson(PreparedContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
