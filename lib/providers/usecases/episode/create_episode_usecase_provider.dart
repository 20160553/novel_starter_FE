import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/episode_repository_provider.dart';
import 'package:novel_starter/repositories/episode_repository.dart';
import 'package:novel_starter/usecases/episode/create_episode_usecase.dart';

final createEpisodeFirestoreUsecaseProvider = Provider<CreateEpisodeUsecase>((ref) {
  final EpisodeRepository episodeRepository = ref.read(episodeRepositoryFirestoreProvider);
  return CreateEpisodeUsecase(episodeRepository);
});