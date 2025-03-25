import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/repositories/comment_repository.dart';

class CreateCommentUsecase {

  const CreateCommentUsecase(this._commentRepository);

  final CommentRepository _commentRepository;

  void execute(Comment comment) async {
    return await _commentRepository.createComment(comment);
  }
}