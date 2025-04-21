import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/like.dart';
import 'package:novel_starter/repositories/like_repository.dart';

class LikeRepositoryFirestore implements LikeRepository {
  LikeRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final _likeRef = _firestore.collection('likes');

  @override
  Future<bool> checkLike(String userId, String contentDetailId) async {
    bool result = false;
    try {
      final snapshot = await _likeRef
          .where("userId", isEqualTo: userId)
          .where("contentDetailId", isEqualTo: contentDetailId)
          .count()
          .get();

      result = (snapshot.count ?? 0) > 0;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  Future<bool> toggleLike(Like like) async {
    final query = _likeRef
        .where("userId", isEqualTo: like.userId)
        .where("contentDetailId", isEqualTo: like.contentDetailId);
    bool result = false;
    try {
      await query.get().then((querySnapShot) {
        if (querySnapShot.size == 0) {
          _likeRef.doc(like.likeId).set(like.toJson());
          result = true;
        } else {
          var docSnapshot = querySnapShot.docs[0];
          Like result = Like.fromJson(docSnapshot.data());
          _likeRef.doc(result.likeId).delete();
        }
      });
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
