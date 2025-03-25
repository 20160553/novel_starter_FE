import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/repositories/comment_repository.dart';

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
  Future<List<Comment>> getCommentsByWorkContentId(String workContentId) {
    // TODO: implement getCommentsByWorkContentId
    throw UnimplementedError();
  }

  @override
  Future<void> updateComment(Comment comment) {
    // TODO: implement updateComment
    throw UnimplementedError();
  }
}
