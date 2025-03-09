import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/episode_repository_provider.dart';
import 'package:novel_starter/usecases/episode/get_episode_usecase.dart';

final getEpisodeFirestoreUsecaseProvider = Provider<GetEpisodeUsecase>((ref) {
  final episodeRepository = ref.read(episodeRepositoryFirestoreProvider);
  return GetEpisodeUsecase(episodeRepository: episodeRepository);
});
