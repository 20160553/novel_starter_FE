import 'package:novel_starter/models/work.dart';

abstract interface class WorkRepository {
  Future<List<Work>> getWorksByUserId(String userId);
  Future<void> createWork(Work work);
}