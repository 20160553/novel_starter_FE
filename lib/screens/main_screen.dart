import 'package:flutter/material.dart';
import 'package:novel_starter/screens/novel_detail_screen.dart';
import 'package:novel_starter/widgets/new_dialog.dart';
import 'package:novel_starter/widgets/side_drawer.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('소설 공유 사이트'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 검색 기능 구현 예정
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: SideDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '추천 소설',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // 추천 소설 개수
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('소설 ${index + 1}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '인기 소설',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 인기 소설 개수
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.book, size: 40),
                  title: Text('인기 소설 ${index + 1}'),
                  subtitle: Text('작성자: 사용자 ${index + 1}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NovelDetailScreen(
                          novelTitle: '환상적인 소설',
                          authorName: '홍길동',
                          serialCycle: '주 2회 연재',
                          imageUrl:
                              'https://static.scientificamerican.com/sciam/cache/file/F766A67E-A8AA-4C90-A929C9AC67075D4B_source.jpg?w=900',
                          notices: ['공지사항 1', '공지사항 2'],
                          episodes: ['1화: 시작', '2화: 모험의 서막', '3화: 위기와 기회'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewDialog();
            },
          );
        },
        child: Icon(Icons.add),
        tooltip: '새 소설 작성',
      ),
    );
  }
}
