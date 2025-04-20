import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/like.dart';
import 'package:novel_starter/usecases/like/like_usecase.dart';

class LikeViewModel extends StateNotifier<ApiState<bool?>>{
  LikeViewModel(this._likeUsecase): super(ApiState.success(data: null));

  final LikeUsecase _likeUsecase;

  void toggleLike(Like like) async {
    state = ApiState.loading();
    try {
      final result = await _likeUsecase.toggleLike(like);
      state = ApiState.success(data: result);
    } catch(e) {
      state = ApiState.error(error: e);
    }
  }

  void checkLike(String userId, String workId) async {
    state = ApiState.loading();
    try {
      final result = await _likeUsecase.checkLike(userId, workId);
      state = ApiState.success(data: result);
    } catch(e) {
      state = ApiState.error(error: e);
    }
  }
}