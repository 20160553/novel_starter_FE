import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_sort_mode.freezed.dart';

@freezed
sealed class CommentSortMode with _$CommentSortMode {
  const factory CommentSortMode.registration()= RegistrationOrder;
  const factory CommentSortMode.latest()= LatestOrder;
  const factory CommentSortMode.recommendation()= RecommendationOrder;
  const factory CommentSortMode.myComment()= MyCommentOrder;
}