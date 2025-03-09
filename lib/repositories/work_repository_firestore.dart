import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/repositories/work_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class WorkRepositoryFirestore implements WorkRepository {
  WorkRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final worksRef = _firestore.collection("works");

  @override
  Future<void> createWork(Work work) async {
    try {
      worksRef.doc(work.workId).set(work.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Work>> getWorksByUserId(String userId) async {
    List<Work> works = [];
    try {
      await worksRef.where("userId", isEqualTo: userId).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            logger.d("Logger ${docSnapshot.id}: ${docSnapshot.data()}");
            works.add(Work.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
      return works;
    } catch (e) {
      logger.e("Logger catch $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteWork(Work work) async {
    try {
      await worksRef.doc(work.workId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Work?> getWorkByWorkId(String workId) async {
    final Map<String, dynamic>? data;
    try {
      final result = await worksRef.doc(workId).get();
      data = result.data();
    } catch (e) {
      rethrow;
    }
    if (data == null) return null;
    return Work.fromJson(data);
  }
}
