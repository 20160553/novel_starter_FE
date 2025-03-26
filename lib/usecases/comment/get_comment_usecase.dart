import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/repositories/comment_repository.dart';

class GetCommentUsecase {
  GetCommentUsecase(this._commentRepository);

  final CommentRepository _commentRepository;

  Future<List<Comment>> getCommentsOrderByRegistration(String workContentId) async {
    return await _commentRepository.getCommentsOrderByRegistration(workContentId);
  }
  Future<List<Comment>> getCommentsOrderByLatest(String workContentId) async {
    return await _commentRepository.getCommentsOrderByLatest(workContentId);
  }
  Future<List<Comment>> getCommentsOrderByRecommendation(String workContentId) async {
    return await _commentRepository.getCommentsOrderByRecommendation(workContentId);
  }
  Future<List<Comment>> getCommentsByUserId(String workContentId, String userId) async {
    return await _commentRepository.getCommentsByUserId(workContentId, userId);
  }
}