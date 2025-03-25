import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/comment_repository_provider.dart';
import 'package:novel_starter/usecases/comment/create_comment_usecase.dart';

final createCommentUsecaseFiresoreProvider = Provider<CreateCommentUsecase>((ref) {
  final commentRepository = ref.read(commentRepositoryFirestoreProvider);
  return CreateCommentUsecase(commentRepository);
});