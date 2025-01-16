import 'package:flutter/material.dart';
import 'package:novel_starter/screens/novel_creating_screen.dart';
import 'package:novel_starter/screens/novel_writing_screen.dart';

class NewDialog extends StatelessWidget {
  NewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('새 등록'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NovelCreatingScreen(),
                ),
              );
            },
            child: Text('새 작품 등록'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NovelWritingScreen(),
                ),
              );
            },
            child: Text('새 회차 등록'),
          ),
        ],
      ),
    );
  }
}
