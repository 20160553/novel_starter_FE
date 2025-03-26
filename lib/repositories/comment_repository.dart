import 'package:novel_starter/models/comment.dart';

abstract interface class CommentRepository {
  Future<void> createComment(Comment comment);
  Future<void> updateComment(Comment comment);
  Future<List<Comment>> getCommentsOrderByRegistration(String workContentId);
  Future<List<Comment>> getCommentsOrderByLatest(String workContentId);
  Future<List<Comment>> getCommentsOrderByRecommendation(String workContentId);
  Future<List<Comment>> getCommentsByUserId(String workContentId, String userId);
  Future<void> deleteComment(Comment comment);
}