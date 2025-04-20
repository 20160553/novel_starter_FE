import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/like_repository_provider.dart';
import 'package:novel_starter/repositories/like_repository.dart';
import 'package:novel_starter/usecases/like/like_usecase.dart';

final likeUsecaseProvider = Provider<LikeUsecase>((ref) {
  final LikeRepository likeRepository = ref.read(likeRepositoryFirestoreProvider);
  return LikeUsecase(likeRepository);
});