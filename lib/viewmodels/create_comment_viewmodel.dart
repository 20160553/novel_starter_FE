import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/usecases/comment/create_comment_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class CreateCommentViewModel extends StateNotifier<ApiState<Object?>>{
  CreateCommentViewModel(this._createCommentUsecase): super(ApiState.success(data: null));

  final CreateCommentUsecase _createCommentUsecase;

  void createComment(Comment comment) {
    state = ApiState.loading();

    try {
      _createCommentUsecase.execute(comment);
      state = ApiState.success(data: comment);
    } on Exception catch(e) {
      state = ApiState.error(error: e);
    }on Error catch(e) {
      logger.e(e);
    }
  }

}