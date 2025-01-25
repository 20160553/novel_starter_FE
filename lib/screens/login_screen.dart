import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class LoginScreen extends ConsumerWidget {

  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final UserViewModel _userViewModel;    

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _userViewModel = ref.read(userViewModelProvider.notifier);
    ref.listen(userViewModelProvider, (prevState, newState) {
      if (newState != null)
        {Navigator.pop(context);}
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
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
                  _userViewModel.login(username, password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
                  );
                }
              },
              child: Text('로그인'),
            ),
            TextButton(
              onPressed: () {
                // 회원가입 화면으로 이동
                print('회원가입 화면으로 이동');
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}