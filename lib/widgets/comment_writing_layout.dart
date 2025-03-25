import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/create_comment_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/create_comment_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class CommentWritingLayout extends ConsumerWidget {
  CommentWritingLayout(this._workContent, {super.key});

  final WorkContent _workContent;
  late final CreateCommentViewmodel _createCommentViewModel;
  late final UserViewModel _userViewModel;

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _createCommentViewModel = ref.read(createCommentViewModelProvider.notifier);
    _userViewModel = ref.read(userViewModelProvider.notifier);

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  minLines: 3,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: '댓글 작성',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  //todo
                  final now = DateTime.now();
                  _createCommentViewModel.createComment(Comment(
                    comment: _commentController.text,
                    commentId: uuid.v4(),
                    createdAt: now,
                    updatedAt: now,
                    userId: _userViewModel.currentUid!,
                    workContentId: _workContent.when(
                      episode: (title, contentDetailId, episodeId, workId,
                              userId, createdAt, updatedAt) =>
                          episodeId,
                      notice: (title, contentDetailId, noticeId, workId, userId,
                              createdAt, updatedAt) =>
                          noticeId,
                    ),
                    workContentType: _workContent is Episode ? "episode" : "notice",
                    workId: _workContent.workId,
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Icon(Icons.edit),
              ),
            ],
          ),
        )
      ],
    );
  }
}
