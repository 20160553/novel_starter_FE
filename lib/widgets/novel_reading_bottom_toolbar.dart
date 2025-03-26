import 'package:flutter/material.dart';

class NovelReadingBottomToolbar extends StatelessWidget {
  const NovelReadingBottomToolbar(this._showComments,
      {super.key, required this.onCommentIconClicked});

  final bool _showComments;
  final void Function() onCommentIconClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // 이전 화로 이동
            },
          ),
          IconButton(
            icon: Icon(Icons.thumb_up, color: Colors.white),
            onPressed: () {
              // 추천 기능 추가
            },
          ),
          IconButton(
            icon: Icon(
              Icons.comment,
              color: _showComments ? Colors.blue : Colors.white,
            ),
            onPressed: () {
              // 댓글 기능 추가
              onCommentIconClicked();
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              // 다음 화로 이동
            },
          ),
        ],
      ),
    );
  }
}
