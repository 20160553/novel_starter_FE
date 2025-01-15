import 'package:flutter/material.dart';
import 'package:novel_starter/screens/novel_reading_screen.dart';

class NovelDetailScreen extends StatelessWidget {
  final String novelTitle;
  final String authorName;
  final String serialCycle;
  final String imageUrl;
  final List<String> notices;
  final List<String> episodes;

  NovelDetailScreen({
    required this.novelTitle,
    required this.authorName,
    required this.serialCycle,
    required this.imageUrl,
    required this.notices,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('소설 정보'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    novelTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '작가: $authorName',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '연재 주기: $serialCycle',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '조회: 100만',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '추천: 100만',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '공지사항',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...notices.map((notice) => ListTile(
                  title: Text(notice),
                  leading: Icon(Icons.announcement),
                )),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '회차 목록',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...episodes.map((episode) => ListTile(
                  title: Text(episode),
                  leading: Icon(Icons.menu_book),
                  onTap: () {
                    // 특정 회차로 이동하는 코드 구현
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NovelReadingScreen(episodeTitle: episode),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}