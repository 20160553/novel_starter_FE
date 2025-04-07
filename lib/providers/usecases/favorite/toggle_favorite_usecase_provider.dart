import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/favorite_repository_provider.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';
import 'package:novel_starter/usecases/favorites/toggle_favorite_usecase.dart';

final toogleFavoriteUsecaseProvider = Provider<ToggleFavoriteUsecase>((ref) {
  FavoriteRepository favoriteRepository = ref.read(favoriteRepositoryFirestoreProvider);
  return ToggleFavoriteUsecase(favoriteRepository);
});