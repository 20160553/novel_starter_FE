import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/usecases/episode/get_episode_usecase_provider.dart';
import 'package:novel_starter/usecases/episode/get_episode_usecase.dart';
import 'package:novel_starter/viewmodels/get_episodes_viewmodel.dart';

final getEpisodesViewModelProvider = StateNotifierProvider<GetEpisodesViewModel, ApiState<List<Episode>?>>((ref) {
  final GetEpisodeUsecase getEpisodeUsecase = ref.read(getEpisodeFirestoreUsecaseProvider);
  return GetEpisodesViewModel(getEpisodeUsecase);
});