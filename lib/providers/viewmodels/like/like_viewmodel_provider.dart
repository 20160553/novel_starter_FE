import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/like/like_usecase_provider.dart';
import 'package:novel_starter/viewmodels/like/like_viewmodel.dart';

final likeViewModelProvider = StateNotifierProvider<LikeViewModel, ApiState<bool?>>((ref) {
  final likeUsecase = ref.read(likeUsecaseProvider);
  return LikeViewModel(likeUsecase);
});