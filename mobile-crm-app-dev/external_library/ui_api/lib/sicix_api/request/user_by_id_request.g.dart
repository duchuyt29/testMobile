// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_by_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserByIdRequest _$UserByIdRequestFromJson(Map<String, dynamic> json) =>
    UserByIdRequest(
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserByIdRequestToJson(UserByIdRequest instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
