import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/favorite/toggle_favorite_usecase_provider.dart';
import 'package:novel_starter/viewmodels/favorite/toggle_favorite_viewmodel.dart';

final toggleFavoriteViewModelProvider = StateNotifierProvider<ToggleFavoriteViewModel, ApiState<bool?>>((ref) {
  final toggleFavoriteUsecase = ref.read(toogleFavoriteUsecaseProvider);
  return ToggleFavoriteViewModel(toggleFavoriteUsecase);
});