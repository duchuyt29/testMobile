// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionModel _$ReactionModelFromJson(Map<String, dynamic> json) =>
    ReactionModel(
      love: json['love'] as int?,
      userReaction: json['userReaction'] as String?,
      haha: json['haha'] as int?,
      like: json['like'] as int?,
      sad: json['sad'] as int?,
      angry: json['angry'] as int?,
      wow: json['wow'] as int?,
      care: json['care'] as int?,
    );

Map<String, dynamic> _$ReactionModelToJson(ReactionModel instance) =>
    <String, dynamic>{
      'userReaction': instance.userReaction,
      'love': instance.love,
      'haha': instance.haha,
      'like': instance.like,
      'sad': instance.sad,
      'angry': instance.angry,
      'wow': instance.wow,
      'care': instance.care,
    };
