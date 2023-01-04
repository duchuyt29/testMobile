// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserByIdResponse _$GetUserByIdResponseFromJson(Map<String, dynamic> json) =>
    GetUserByIdResponse(
      (json['data'] as List<dynamic>?)
              ?.map((e) => UserChatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserByIdResponseToJson(
        GetUserByIdResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
