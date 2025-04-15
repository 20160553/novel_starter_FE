import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/screens/login_screen.dart';
import 'package:novel_starter/screens/novel_manage_screen.dart';
import 'package:novel_starter/screens/study_screen.dart';
import 'package:novel_starter/screens/book_shelf_screen.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

const default_username = "메뉴";

class SideDrawer extends ConsumerStatefulWidget {
  const SideDrawer({super.key});

  @override
  ConsumerState<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends ConsumerState<SideDrawer> {
  late final UserViewModel _userViewModel;
  String username = default_username;

  @override
  void initState() {
    super.initState();
    // UserViewModel을 여기서 초기화
    _userViewModel = ref.read(userViewModelProvider.notifier);
    final apiState = ref.read(userViewModelProvider);
    apiState.when(
        loading: () {},
        success: (data) {
          username = data?.email ?? default_username;
        },
        error: (e) {});
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userViewModelProvider, (previous, next) {
      if (next is SuccessState) {
        final newStr =
            (next as SuccessState).data?.username ?? default_username;
        print("newStr: $newStr");
        setState(() {
          username = newStr;
        });
      }
    });

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              username,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          if (username != default_username)
            ListTile(
              leading: Icon(Icons.person),
              title: Text('회원정보'),
              onTap: () {
                // 회원정보 클릭 시 동작
              },
            ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('무료 소설'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookShelfScreen(),
                ),
              );
            },
          ),
          if (username != default_username)
            ListTile(
              leading: Icon(Icons.book),
              title: Text('내 서재'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudyScreen(),
                  ),
                );
              },
            ),
          if (username != default_username)
            ListTile(
              leading: Icon(Icons.book),
              title: Text('작품관리'),
              onTap: () {
                // 작품관리 클릭 시 동작
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NovelManageScreen(),
                  ),
                );
              },
            ),
          username == default_username
              ? ListTile(
                  leading: Icon(Icons.login),
                  title: Text('로그인'),
                  onTap: () {
                    // 로그인 클릭 시 동작
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                )
              : ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('로그아웃'),
                  onTap: () {
                    _userViewModel.logout();
                  },
                ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정'),
            onTap: () {
              // 설정 클릭 시 동작
            },
          ),
        ],
      ),
    );
  }
}
