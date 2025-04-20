import 'package:novel_starter/models/like.dart';
import 'package:novel_starter/repositories/like_repository.dart';

class LikeUsecase {
  const LikeUsecase(this._likeRepository);

  final LikeRepository _likeRepository;

  Future<bool> toggleLike(Like like) async {
    return await _likeRepository.toggleLike(like);
  }

  Future<bool> checkLike(String userId, String workId) async {
    return await _likeRepository.checkLike(userId, workId);
  }

}