// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_relation_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRelationType _$AccountRelationTypeFromJson(Map<String, dynamic> json) =>
    AccountRelationType(
      accountaccountRelationRelatedId:
          json['accountaccountRelationRelatedId'] as int?,
      accountRelationTypeName: json['accountRelationTypeName'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AccountRelationTypeToJson(
        AccountRelationType instance) =>
    <String, dynamic>{
      'accountaccountRelationRelatedId':
          instance.accountaccountRelationRelatedId,
      'accountRelationTypeName': instance.accountRelationTypeName,
      'id': instance.id,
    };
