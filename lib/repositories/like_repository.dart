import 'package:novel_starter/models/like.dart';

abstract interface class LikeRepository {
  Future<bool> toggleLike(Like like);
  Future<bool> checkLike(String userId, String workId);
}