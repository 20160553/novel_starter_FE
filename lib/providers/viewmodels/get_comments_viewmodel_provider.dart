import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/providers/usecases/comment/get_comment_usecase_provider.dart';
import 'package:novel_starter/usecases/comment/get_comment_usecase.dart';
import 'package:novel_starter/viewmodels/get_comments_viewmodel.dart';

final getCommentsViewModelProvider = StateNotifierProvider<GetCommentsViewModel, ApiState<List<Comment>?>>((ref) {
  final GetCommentUsecase getCommentUsecase = ref.read(getCommentUsecaseFirestoreProvider);
  return GetCommentsViewModel(getCommentUsecase);
});