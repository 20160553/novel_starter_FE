import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/comment/create_comment_usecase_provider.dart';
import 'package:novel_starter/viewmodels/create_comment_viewmodel.dart';

final createCommentViewModelProvider = StateNotifierProvider<CreateCommentViewModel, ApiState<Object?>>((ref) {
  final createCommentUsecase = ref.read(createCommentUsecaseFiresoreProvider);
  return CreateCommentViewModel(createCommentUsecase);
});