import 'package:flutter/material.dart';
import 'package:novel_starter/models/favorite.dart';

class NovelReadingTopToolbar extends StatelessWidget {
  const NovelReadingTopToolbar({super.key, required this.title, required this.onToggleFavorite});

  final String title;
  final void Function() onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: () {
              // 회차 목록으로 이동
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              // 선호작 기능 추가
              onToggleFavorite();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
