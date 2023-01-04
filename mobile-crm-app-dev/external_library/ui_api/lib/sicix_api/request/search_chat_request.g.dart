// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchChatRequest _$SearchChatRequestFromJson(Map<String, dynamic> json) =>
    SearchChatRequest(
      search: json['search'] as String?,
    );

Map<String, dynamic> _$SearchChatRequestToJson(SearchChatRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('search', instance.search);
  return val;
}
