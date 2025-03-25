import 'package:flutter/material.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/widgets/comment_list_tile.dart';

class CommentListView extends StatelessWidget {
  const CommentListView(this._comments, {super.key});

  final List<Comment> _comments;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("등록순"),
                Text("조회순"),
                Text("추천순"),
                Text("내댓순"),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommentListTile(comment: _comments[index],);
                },
              ),
            )
          ],
        ));
  }
}
