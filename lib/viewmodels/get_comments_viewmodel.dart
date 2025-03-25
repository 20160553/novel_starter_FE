import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/usecases/comment/get_comment_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetCommentsViewModel extends StateNotifier<ApiState<List<Comment>?>> {
  GetCommentsViewModel(this._getCommentUsecase): super(ApiState.success(data: null));

  final GetCommentUsecase _getCommentUsecase;

  void getCommentsByWorkContentId(String workContentId) async {
    state = ApiState.loading();
    
    try {
      final comments = await _getCommentUsecase.execute(workContentId);
      state = ApiState.success(data: comments);
    } on Exception catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
    }on Error catch(e) {
      logger.e(e);
    }
  }
}
