// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_content_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkContentDetailImpl _$$WorkContentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkContentDetailImpl(
      contentDetailId: json['contentDetailId'] as String,
      workContentId: json['workContentId'] as String,
      userId: json['userId'] as String,
      body: json['body'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$WorkContentDetailImplToJson(
        _$WorkContentDetailImpl instance) =>
    <String, dynamic>{
      'contentDetailId': instance.contentDetailId,
      'workContentId': instance.workContentId,
      'userId': instance.userId,
      'body': instance.body,
      'comment': instance.comment,
    };
