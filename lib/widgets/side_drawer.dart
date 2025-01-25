import 'package:flutter/material.dart';
import 'package:novel_starter/screens/login_screen.dart';
import 'package:novel_starter/screens/novel_manage_screen.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              '메뉴',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('회원정보'),
            onTap: () {
              // 회원정보 클릭 시 동작
            },
          ),
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
          ListTile(
            leading: Icon(Icons.login),
            title: Text('로그인'),
            onTap: () {
              // 로그인 클릭 시 동작
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('로그아웃'),
            onTap: () {
              // 로그아웃 클릭 시 동작
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
