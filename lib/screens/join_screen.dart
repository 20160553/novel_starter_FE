import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/constants/string.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/join_result.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/providers/viewmodels/join_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/nickname/nickname_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/join_viewmodel.dart';
import 'package:novel_starter/viewmodels/user/nickname_viewmodel.dart';

class JoinScreen extends ConsumerStatefulWidget {
  const JoinScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _JoinScreen();
  }
}

class _JoinScreen extends ConsumerState<JoinScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final JoinViewModel _joinViewModel;
  late final NicknameViewModel _nicknameViewModel;

  @override
  void initState() {
    super.initState();
    _joinViewModel = ref.read(joinViewModelProvider.notifier);
    _nicknameViewModel = ref.read(nicknameViewModelProvider.notifier);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEmailAvailable = false;
    bool isNicknameAvailable = false;

    ref.listen(joinViewModelProvider, (prevState, newState) {
      if (newState is SuccessState) {
        final tempState = newState as SuccessState;
        if (tempState.data != null) {
          final data = tempState.data as JoinResult;
          data.when(duplicated: () {
            showSnackBar(context, duplicatedEmailString, 1);
            isEmailAvailable = false;
          }, unDuplicated: () {
            showSnackBar(context, availableEmailString, 1);
            isEmailAvailable = true;
          }, success: () {
            showSnackBar(context, joinSuccessString, 1);
            Navigator.pop(context);
          });
        }
      } else if (newState is ErrorState) {
        final e = newState as firebase_auth.FirebaseAuthException;
        if (e.code == 'weak-password') {
          showSnackBar(context, unavailablePasswordString, 1);
        }
      }
    });

    ref.listen(nicknameViewModelProvider, (prevState, newState) {
      if (newState is SuccessState) {
        SuccessState state = newState as SuccessState;
        late String snackBarString;
        if (state.data ?? true) {
          snackBarString = unavailableNicknameString;
          isNicknameAvailable = false;
        } else {
          snackBarString = availableNicknameString;
          isNicknameAvailable = true;
        }
        showSnackBar(context, snackBarString, 1);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(joinString),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: emailLabelString,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  child: Text('중복확인'),
                  onTap: () {
                    String email = _emailController.text;
                    if (email.isNotEmpty) {
                      _joinViewModel.duplicatedCheck(email);
                    } else {
                      showSnackBar(context, emptyEmailOrPassword, 1);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nicknameController,
                    decoration: InputDecoration(
                      labelText: nicknameLabelString,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  child: Text('중복확인'),
                  onTap: () {
                    String nickname = _nicknameController.text;
                    if (nickname.isNotEmpty) {
                      _nicknameViewModel.checkNickname(nickname);
                    } else {
                      showSnackBar(context, unavailableNicknameString, 1);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              // enabled: flag,
              decoration: InputDecoration(
                labelText: passwordLabelString,
                hintText: passwordHintString,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (!(isNicknameAvailable && isEmailAvailable)) {
                  showSnackBar(context, plzCheckEmailOrNicknameString, 1);
                  return;
                }
                User user = User(
                    uid: '',
                    email: _emailController.text,
                    nickname: _nicknameController.text);
                String password = _passwordController.text;
                if (user.email.isNotEmpty &&
                    user.nickname.isNotEmpty &&
                    password.isNotEmpty) {
                  _joinViewModel.join(user, password);
                } else {
                  showSnackBar(context, emailLabelString, 1);
                }
              },
              child: Text(joinString),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(backString),
            ),
          ],
        ),
      ),
    );
  }
}
