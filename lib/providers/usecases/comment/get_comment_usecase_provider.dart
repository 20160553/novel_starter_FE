import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/comment_repository_provider.dart';
import 'package:novel_starter/repositories/comment_repository.dart';
import 'package:novel_starter/usecases/comment/get_comment_usecase.dart';

final getCommentUsecaseFirestoreProvider = Provider<GetCommentUsecase>((ref) {
  final CommentRepository commentRepository = ref.read(commentRepositoryFirestoreProvider);
  return GetCommentUsecase(commentRepository);
});