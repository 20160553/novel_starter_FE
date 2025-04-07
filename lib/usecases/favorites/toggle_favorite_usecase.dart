import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';

class ToggleFavoriteUsecase {
  ToggleFavoriteUsecase(this._favoriteRepository);
  
  final FavoriteRepository _favoriteRepository;

  Future<void> execute(Favorite favorite) async {
    return await _favoriteRepository.toogleFavorite(favorite);
  }
}