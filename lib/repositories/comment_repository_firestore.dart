import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/repositories/comment_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class CommentRepositoryFirestore implements CommentRepository {
  CommentRepositoryFirestore(this._firestore);

  late final FirebaseFirestore _firestore;
  late final _commentRef = _firestore.collection("comments");

  @override
  Future<void> createComment(Comment comment) async {
    try {
      _commentRef.doc(comment.commentId).set(comment.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteComment(Comment comment) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<void> updateComment(Comment comment) {
    // TODO: implement updateComment
    throw UnimplementedError();
  }

  @override
  Future<List<Comment>> getCommentsOrderByRegistration(
      String workContentId) async {
    List<Comment> comments = [];
    try {
      await _commentRef
          .orderBy("createdAt")
          .where("workContentId", isEqualTo: workContentId)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            comments.add(Comment.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      rethrow;
    }
    return comments;
  }

  @override
  Future<List<Comment>> getCommentsByUserId(
      String workContentId, String userId) async {
    List<Comment> comments = [];
    try {
      await _commentRef
          .orderBy("createdAt")
          .where("workContentId", isEqualTo: workContentId)
          .where("userId", isEqualTo: userId)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            comments.add(Comment.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      rethrow;
    }
    return comments;
  }

  @override
  Future<List<Comment>> getCommentsOrderByLatest(String workContentId) async {
    List<Comment> comments = [];
    try {
      await _commentRef
          .orderBy("createdAt", descending: true)
          .where("workContentId", isEqualTo: workContentId)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            comments.add(Comment.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      rethrow;
    }
    return comments;
  }

  @override
  Future<List<Comment>> getCommentsOrderByRecommendation(
      String workContentId) async {
    List<Comment> comments = [];
    // try {
    //   await _commentRef
    //       .orderBy("createdAt")
    //       .where("workContentId", isEqualTo: workContentId)
    //       .get()
    //       .then(
    //     (querySnapshot) {
    //       for (var docSnapshot in querySnapshot.docs) {
    //         comments.add(Comment.fromJson(docSnapshot.data()));
    //       }
    //     },
    //     onError: (e) => logger.e("Logger $e"),
    //   );
    // } catch (e) {
    //   rethrow;
    // }
    //TODO
    return comments;
  }
}
