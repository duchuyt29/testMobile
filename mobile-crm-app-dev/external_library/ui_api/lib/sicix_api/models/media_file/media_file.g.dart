// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaFile _$MediaFileFromJson(Map<String, dynamic> json) => MediaFile(
      id: _valueToString(json['id']),
      name: json['name'] as String?,
      ref: json['ref'] as String?,
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$MediaFileToJson(MediaFile instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ref', instance.ref);
  val['contentType'] = MediaFile.toNull(instance.contentType);
  return val;
}
