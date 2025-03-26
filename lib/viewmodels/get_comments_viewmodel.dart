import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/models/comment_sort_mode.dart';
import 'package:novel_starter/usecases/comment/get_comment_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetCommentsViewModel extends StateNotifier<ApiState<List<Comment>?>> {
  GetCommentsViewModel(this._getCommentUsecase)
      : super(ApiState.success(data: null));

  final GetCommentUsecase _getCommentUsecase;
  CommentSortMode _commentsSortMode = CommentSortMode.registration();
  CommentSortMode get commentsSortMode => _commentsSortMode;

  void changeCommentsMode(CommentSortMode commentSortMode, String workContentId,
      {String userId = "default"}) {
    _commentsSortMode = commentSortMode;
    getCommentsByWorkContentId(workContentId, userId: userId);
  }

  void getCommentsByWorkContentId(String workContentId,
      {String userId = "default"}) {
    switch (_commentsSortMode) {
      case RegistrationOrder():
        getCommentsOrderByRegistration(workContentId);
      case LatestOrder():
        getCommentsOrderByLatest(workContentId);
      case RecommendationOrder():
        getCommentsOrderByRecommendation(workContentId);
      case MyCommentOrder():
        getCommentsByUserId(workContentId, userId);
    }
  }

  void getCommentsOrderByRegistration(String workContentId) async {
    state = ApiState.loading();
    try {
      final comments = await _getCommentUsecase
          .getCommentsOrderByRegistration(workContentId);
      state = ApiState.success(data: comments);
    } on Exception catch (e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } on Error catch (e) {
      logger.e(e);
    }
  }

  void getCommentsOrderByLatest(String workContentId) async {
    state = ApiState.loading();

    try {
      final comments =
          await _getCommentUsecase.getCommentsOrderByLatest(workContentId);
      state = ApiState.success(data: comments);
    } on Exception catch (e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } on Error catch (e) {
      logger.e(e);
    }
  }

  void getCommentsOrderByRecommendation(String workContentId) async {
    state = ApiState.loading();

    try {
      final comments = await _getCommentUsecase
          .getCommentsOrderByRecommendation(workContentId);
      state = ApiState.success(data: comments);
    } on Exception catch (e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } on Error catch (e) {
      logger.e(e);
    }
  }

  void getCommentsByUserId(String workContentId, String userId) async {
    state = ApiState.loading();

    try {
      final comments =
          await _getCommentUsecase.getCommentsByUserId(workContentId, userId);
      state = ApiState.success(data: comments);
    } on Exception catch (e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } on Error catch (e) {
      logger.e(e);
    }
  }
}
