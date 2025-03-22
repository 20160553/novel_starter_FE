import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/repositories/work_content_detail_repository.dart';

class WorkContentDetailRepositoryFirestore
    implements WorkContentDetailRepository {
  WorkContentDetailRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final _workContentDetailRef = _firestore.collection('content-details');

  @override
  Future<void> createWorkContentDetail(
      WorkContentDetail workContentDetial) async {
    try {
      return _workContentDetailRef
          .doc(workContentDetial.contentDetailId)
          .set(workContentDetial.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteWorkContentDetail(WorkContentDetail workContentDetial) {
    // TODO: implement deleteWorkContentDetail
    throw UnimplementedError();
  }

  @override
  Future<WorkContentDetail?> getWorkContentDetailById(
      String workContentDetailId) async {
    final Map<String, dynamic>? data;
    try {
      final result = await _workContentDetailRef.doc(workContentDetailId).get();
      data = result.data();
    } catch (e) {
      rethrow;
    }
    return data == null ? null : WorkContentDetail.fromJson(data);
  }

  @override
  Future<void> updateWorkContentDetail(WorkContentDetail workContentDetial) {
    // TODO: implement updateWorkContentDetail
    throw UnimplementedError();
  }
}
