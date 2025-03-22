// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      title: json['title'] as String,
      contentDetailId: json['contentDetailId'] as String,
      episodeId: json['episodeId'] as String,
      workId: json['workId'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contentDetailId': instance.contentDetailId,
      'episodeId': instance.episodeId,
      'workId': instance.workId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      title: json['title'] as String,
      contentDetailId: json['contentDetailId'] as String,
      noticeId: json['noticeId'] as String,
      workId: json['workId'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contentDetailId': instance.contentDetailId,
      'noticeId': instance.noticeId,
      'workId': instance.workId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'runtimeType': instance.$type,
    };
