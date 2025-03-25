import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';


@freezed
class Comment with _$Comment {
  const factory Comment({
    required String commentId,
    required String workContentId,
    required String workId,
    required String userId,
    required String comment,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String workContentType,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}