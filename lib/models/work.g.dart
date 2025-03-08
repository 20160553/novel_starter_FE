// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkImpl _$$WorkImplFromJson(Map<String, dynamic> json) => _$WorkImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      workId: json['workId'] as String,
      userId: json['userId'] as String,
      thumbnailImgUrl: json['thumbnailImgUrl'] as String? ?? imageUrlMockup,
    );

Map<String, dynamic> _$$WorkImplToJson(_$WorkImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'workId': instance.workId,
      'userId': instance.userId,
      'thumbnailImgUrl': instance.thumbnailImgUrl,
    };
