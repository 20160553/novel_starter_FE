import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novel_starter/entities/work_entity.dart';
import 'package:novel_starter/utils/mockup.dart';

part 'work.g.dart';
part 'work.freezed.dart';

@Freezed()
class Work with _$Work {

  const Work._();

  factory Work({
    required String title,
    required String description,
    // required int genreId,
    // required int ageId,
    @Default(0) int favoriteCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String workId,
    required String userId,
    @Default(imageUrlMockup) String thumbnailImgUrl,
  }) = _Work;

  Work fromWorkEntity(WorkEntity workEntity) {
    return Work.fromJson(workEntity.toJson());
  }

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);  
}
