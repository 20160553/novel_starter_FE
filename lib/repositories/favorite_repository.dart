import 'package:novel_starter/models/favorite.dart';

abstract interface class FavoriteRepository {
  Future<bool> toogleFavorite(Favorite favorite);
  Future<List<Favorite>> getFavoritesByUserId(String userId);
}