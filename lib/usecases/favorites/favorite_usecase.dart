import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';

class FavoriteUsecase {
  FavoriteUsecase(this._favoriteRepository);
  
  final FavoriteRepository _favoriteRepository;

  Future<bool> toggleFavorite(Favorite favorite) async {
    return await _favoriteRepository.toogleFavorite(favorite);
  }

  Future<bool> checkFavorite(String userId, String workId) async {
    return await _favoriteRepository.checkFavorite(userId, workId);
  }
}