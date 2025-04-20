import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/favorite/favorite_usecase_provider.dart';
import 'package:novel_starter/viewmodels/favorite/favorite_viewmodel.dart';

final favoriteViewModelProvider = StateNotifierProvider<FavoriteViewModel, ApiState<bool?>>((ref) {
  final toggleFavoriteUsecase = ref.read(favoriteUsecaseProvider);
  return FavoriteViewModel(toggleFavoriteUsecase);
});