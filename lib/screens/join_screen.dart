import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/constants/string.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/join_result.dart';
import 'package:novel_starter/providers/viewmodels/join_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/join_viewmodel.dart';

class JoinScreen extends ConsumerStatefulWidget {
  const JoinScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _JoinScreen();
  }
}

class _JoinScreen extends ConsumerState<JoinScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final JoinViewModel _joinViewModel;

  @override
  void initState() {
    super.initState();
    _joinViewModel = ref.read(joinViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    // final flag = ref.watch(joinViewModelProvider.select((state) =>
    //     state is SuccessState && state.data is UnDuplicatedUsername));

    ref.listen(joinViewModelProvider, (prevState, newState) {
      if (newState is SuccessState) {
        final tempState = newState as SuccessState;
        if (tempState.data != null) {
          final data = tempState.data as JoinResult;
          data.when(duplicated: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(duplicatedEmailString),
                duration: Duration(seconds: 1),
              ),
            );
          }, unDuplicated: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(availableEmailString),
                duration: Duration(seconds: 1),
              ),
            );
          }, success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(joinSuccessString),
                duration: Duration(seconds: 1),
              ),
            );
            Navigator.pop(context);
          });
        }
      } else if (newState is ErrorState) {
        final e = newState as FirebaseAuthException;
        if (e.code == 'weak-password') {
          SnackBar(
            content: Text(unavailablePasswordString),
            duration: Duration(seconds: 1),
          );
        }
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
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: emailLabelString,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // SizedBox(width: 8),
                // GestureDetector(
                //   child: Text('중복확인'),
                //   onTap: () {
                //     String username = _usernameController.text;
                //     if (username.isNotEmpty) {
                //       _joinViewModel.duplicatedCheck(username);
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
                //       );
                //     }
                //   },
                // ),
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
                String username = _usernameController.text;
                String password = _passwordController.text;

                // 로그인 로직 추가
                if (username.isNotEmpty && password.isNotEmpty) {
                  _joinViewModel.join(username, password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(emptyEmailOrPassword)),
                  );
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
