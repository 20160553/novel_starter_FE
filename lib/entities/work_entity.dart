import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_entity.freezed.dart';
part 'work_entity.g.dart';

@Freezed()
class WorkEntity with _$WorkEntity {
  
  const factory WorkEntity({
    required String title,
    required String description,
    // required int genreId,
    // required int ageId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String workId,
    required String userId,
    required String thumbnailImgUrl,
  }) = _WorkEntity;
  
  factory WorkEntity.fromJson(Map<String, dynamic> json) => _$WorkEntityFromJson(json);  
}