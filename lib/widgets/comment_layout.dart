import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/models/comment_sort_mode.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/create_comment_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/get_comments_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/create_comment_viewmodel.dart';
import 'package:novel_starter/viewmodels/get_comments_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';
import 'package:novel_starter/widgets/comment_list_view.dart';
import 'package:novel_starter/widgets/comment_writing_layout.dart';

class CommentLayout extends ConsumerStatefulWidget {
  const CommentLayout(this.workContent, {super.key});

  final WorkContent workContent;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CommentLayout();
  }
}

class _CommentLayout extends ConsumerState<CommentLayout> {
  late List<Comment> _comments;
  late final UserViewModel _userViewModel;
  late final CreateCommentViewModel _createCommentViewModel;
  late final GetCommentsViewModel _getCommentsViewModel;

  @override
  void initState() {
    _comments = [];
    _createCommentViewModel = ref.read(createCommentViewModelProvider.notifier);
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _getCommentsViewModel = ref.read(getCommentsViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _getCommentsViewModel.getCommentsByWorkContentId(widget.workContent.when(
        episode: (title, contentDetailId, episodeId, workId, userId, createdAt,
                updatedAt) =>
            episodeId,
        notice: (title, contentDetailId, noticeId, workId, userId, createdAt,
                updatedAt) =>
            noticeId)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _comments = ref.watch(getCommentsViewModelProvider).when(
          loading: () => _comments,
          success: (data) {
            return data ?? _comments;
          },
          error: (error) => _comments,
        );
    ref.listen(createCommentViewModelProvider, (previousState, newState) {
      newState.when(
        loading: () {},
        success: (data) {
          final workContentId = widget.workContent is Episode
              ? (widget.workContent as Episode).episodeId
              : (widget.workContent as Notice).noticeId;
          _getCommentsViewModel.getCommentsByWorkContentId(workContentId);
        },
        error: (error) {},
      );
    });
    String workContentId = widget.workContent.when(
        episode: (title, contentDetailId, episodeId, workId, userId, createdAt,
                updatedAt) =>
            episodeId,
        notice: (title, contentDetailId, noticeId, workId, userId, createdAt,
                updatedAt) =>
            noticeId);
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CommentWritingLayout((content) {
                final now = DateTime.now();
                _createCommentViewModel.createComment(Comment(
                  comment: content,
                  commentId: uuid.v4(),
                  createdAt: now,
                  updatedAt: now,
                  userId: _userViewModel.currentUid!,
                  workContentId: workContentId,
                  workContentType:
                      widget.workContent is Episode ? "episode" : "notice",
                  workId: widget.workContent.workId,
                ));
              }),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () => _getCommentsViewModel.changeCommentsMode(
                          RegistrationOrder(), workContentId,
                          userId: _userViewModel.currentUid!),
                      child: Text(
                        "등록순",
                        style: TextStyle(
                            fontWeight: _getCommentsViewModel.commentsSortMode
                                    is RegistrationOrder
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )),
                  GestureDetector(
                      onTap: () => _getCommentsViewModel.changeCommentsMode(
                          LatestOrder(), workContentId,
                          userId: _userViewModel.currentUid!),
                      child: Text(
                        "조회순",
                        style: TextStyle(
                            fontWeight: _getCommentsViewModel.commentsSortMode
                                    is LatestOrder
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )),
                  GestureDetector(
                      onTap: () => _getCommentsViewModel.changeCommentsMode(
                          RecommendationOrder(), workContentId,
                          userId: _userViewModel.currentUid!),
                      child: Text(
                        "추천순",
                        style: TextStyle(
                            fontWeight: _getCommentsViewModel.commentsSortMode
                                    is RecommendationOrder
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )),
                  GestureDetector(
                      onTap: () => _getCommentsViewModel.changeCommentsMode(
                          MyCommentOrder(), workContentId,
                          userId: _userViewModel.currentUid!),
                      child: Text(
                        "내댓순",
                        style: TextStyle(
                            fontWeight: _getCommentsViewModel.commentsSortMode
                                    is MyCommentOrder
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CommentListView(_comments),
            ],
          ),
        ),
      ),
    );
  }
}
