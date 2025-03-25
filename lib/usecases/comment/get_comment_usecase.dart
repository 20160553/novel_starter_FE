import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/repositories/comment_repository.dart';

class GetCommentUsecase {
  GetCommentUsecase(this._commentRepository);

  final CommentRepository _commentRepository;

  Future<List<Comment>> execute(String workContentId) async {
    return await _commentRepository.getCommentsByWorkContentId(workContentId);
  }
}