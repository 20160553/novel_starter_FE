import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/join_result.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/usecases/join_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class JoinViewModel extends StateNotifier<ApiState<JoinResult?>> {
  JoinViewModel(this._joinUsecase) : super(ApiState.success(data: null));

  final JoinUsecase _joinUsecase;

  void join(User user, String password) async {
    state = ApiState.loading();
    try {
      await _joinUsecase.execute(user, password);

      state = ApiState.success(data: JoinResult.success());
    } on firebase_auth.FirebaseAuthException catch (e) {
      logger.e("Logger $e");
      if (e.code == 'weak-password') {
        state = ApiState.error(error: e);
      } else if (e.code == 'email-already-in-use') {
        state = ApiState.success(data: JoinResult.duplicated());
      }
      state = ApiState.error(error: e);
    } on Exception catch (e) {
      logger.e("Logger $e");
      state = ApiState.error(error: e);
    } catch (e) {
      logger.e("Logger $e");
    }
  }

  void duplicatedCheck(String email) async {
    state = ApiState.loading();
    try {
      final result = await _joinUsecase.duplicatedCheck(email);
      JoinResult data =
          result ? JoinResult.duplicated() : JoinResult.unDuplicated();
      state = ApiState.success(data: data);
    } on Exception catch (e) {
      state = ApiState.error(error: e);
    } catch (e) {
      logger.e(e);
    }
  }
}
