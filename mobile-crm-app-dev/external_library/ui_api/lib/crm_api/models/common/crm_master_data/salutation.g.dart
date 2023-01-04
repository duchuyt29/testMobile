// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salutation _$SalutationFromJson(Map<String, dynamic> json) => Salutation(
      id: json['id'] as int?,
      salutationName: json['salutationName'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SalutationToJson(Salutation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salutationName': instance.salutationName,
      'status': instance.status,
    };
