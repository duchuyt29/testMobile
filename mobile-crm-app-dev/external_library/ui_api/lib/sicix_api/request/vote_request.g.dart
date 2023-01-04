// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteRequest _$VoteRequestFromJson(Map<String, dynamic> json) => VoteRequest(
      json['id'] as int,
      (json['answerIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$VoteRequestToJson(VoteRequest instance) =>
    <String, dynamic>{
      'id': instance.pollId,
      'answerIds': instance.answerIds,
    };
