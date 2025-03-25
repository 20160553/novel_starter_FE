import 'package:novel_starter/models/comment.dart';

abstract interface class CommentRepository {
  Future<void> createComment(Comment comment);
  Future<void> updateComment(Comment comment);
  Future<List<Comment>> getCommentsByWorkContentId(String workContentId);
  Future<void> deleteComment(Comment comment);
}