import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/favorite_repository_provider.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';
import 'package:novel_starter/usecases/favorites/favorite_usecase.dart';

final favoriteUsecaseProvider = Provider<FavoriteUsecase>((ref) {
  FavoriteRepository favoriteRepository = ref.read(favoriteRepositoryFirestoreProvider);
  return FavoriteUsecase(favoriteRepository);
});