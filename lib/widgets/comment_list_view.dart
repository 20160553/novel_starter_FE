import 'package:flutter/material.dart';
import 'package:novel_starter/widgets/comment_list_tile.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key});

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
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommentListTile(comment: "$index",);
                },
              ),
            )
          ],
        ));
  }
}
