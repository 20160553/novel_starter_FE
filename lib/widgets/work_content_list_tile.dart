import 'package:flutter/material.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/screens/novel_reading_screen.dart';

class WorkContentListTile extends StatelessWidget {
  const WorkContentListTile({super.key, required this.workContent});

  final WorkContent workContent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(workContent.title),
      leading: workContent is Episode ? Icon(Icons.menu_book): Icon(Icons.announcement),
      onTap: () {
        // 특정 회차로 이동하는 코드 구현
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NovelReadingScreen(episodeTitle: workContent.title),
          ),
        );
      },
    );
  }
}
