import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final flag = ref.watch(joinViewModelProvider.select((state) =>
        state is SuccessState && state.data is UnDuplicatedUsername));

    ref.listen(joinViewModelProvider, (prevState, newState) {
      if (newState is SuccessState) {
        if (newState.data != null) {
          final data = newState.data as JoinResult;
          data.when(duplicated: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('닉네임이 이미 존재합니다'),
                duration: Duration(seconds: 1),
              ),
            );
          }, unDuplicated: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('사용할 수 있는 닉네임입니다'),
                duration: Duration(seconds: 1),),
            );
          }, success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('회원가입에 성공하였습니다'),
                duration: Duration(seconds: 1),),
            );
            Navigator.pop(context);
          });
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
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
                      labelText: '아이디',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  child: Text('중복확인'),
                  onTap: () {
                    String username = _usernameController.text;
                    if (username.isNotEmpty) {
                      _joinViewModel.duplicatedCheck(username);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              enabled: flag,
              decoration: InputDecoration(
                labelText: '비밀번호',
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
                  //todo join
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
                  );
                }
              },
              child: Text('회원가입'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
