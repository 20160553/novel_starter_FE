import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';

class FavoriteRepositoryFirestore implements FavoriteRepository {
  FavoriteRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final _favoriteRef = _firestore.collection('favorites');

  @override
  Future<bool> toogleFavorite(Favorite favorite) async {
    final query = _favoriteRef
        .where("userId", isEqualTo: favorite.userId)
        .where("workId", isEqualTo: favorite.workId);
    bool result = false;
    try {
      await query.get().then((querySnapShot) {
        if (querySnapShot.size == 0) {
          _favoriteRef.doc(favorite.favoriteId).set(favorite.toJson());
          result = true;
        } else {
          for (var docSnapshot in querySnapShot.docs) {
            Favorite result = Favorite.fromJson(docSnapshot.data());
            _favoriteRef.doc(result.favoriteId).delete();
          }
        }
      });
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  Future<List<Favorite>> getFavoritesByUserId(String userId) async {
    // TODO: implement getFavoritesByUserId
    throw UnimplementedError();
  }
}
