import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/constants/string.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/screens/join_screen.dart';
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
      if (newState != null) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(loginString),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: emailLabelString,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: passwordHintString,
                labelText: passwordLabelString,
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
                    SnackBar(content: Text(emptyEmailOrPassword)),
                  );
                }
              },
              child: Text(loginString),
            ),
            TextButton(
              onPressed: () {
                // 회원가입 화면으로 이동
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JoinScreen()));
              },
              child: Text(joinString),
            ),
          ],
        ),
      ),
    );
  }
}
