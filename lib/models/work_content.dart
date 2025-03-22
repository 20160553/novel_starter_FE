import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_content.freezed.dart';
part 'work_content.g.dart';

@freezed
class WorkContent with _$WorkContent {
  const factory WorkContent.episode({
    required String title,
    required String contentDetailId,
    required String episodeId,
    required String workId,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = Episode;

  const factory WorkContent.notice({
    required String title,
    required String contentDetailId,
    required String noticeId,
    required String workId,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = Notice;

  factory WorkContent.fromJson(Map<String, dynamic> json) => _$WorkContentFromJson(json);
}