import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/usecases/favorites/toggle_favorite_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class ToggleFavoriteViewModel extends StateNotifier<ApiState<bool?>>{
  ToggleFavoriteViewModel(this._toggleFavoriteUsecase): super(ApiState.success(data: null));

  final ToggleFavoriteUsecase _toggleFavoriteUsecase;

  void toggleFavorite(Favorite favorite) async {
    state = ApiState.loading();

    try {
      final result = await _toggleFavoriteUsecase.execute(favorite);
      state = ApiState.success(data: result);
    } catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } 
  }

}