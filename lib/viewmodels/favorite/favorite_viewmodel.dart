import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/usecases/favorites/favorite_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class FavoriteViewModel extends StateNotifier<ApiState<bool?>>{
  FavoriteViewModel(this._favoriteUsecase): super(ApiState.success(data: null));

  final FavoriteUsecase _favoriteUsecase;

  void toggleFavorite(Favorite favorite) async {
    state = ApiState.loading();

    try {
      final result = await _favoriteUsecase.toggleFavorite(favorite);
      state = ApiState.success(data: result);
    } catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } 
  }

  void checkFavorite(String userId, String workId) async {
    state = ApiState.loading();
    try {
      final result = await _favoriteUsecase.checkFavorite(userId, workId);
      state = ApiState.success(data: result);
    } catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } 
  }

}