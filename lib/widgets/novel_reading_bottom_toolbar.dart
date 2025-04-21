import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/like.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/like/like_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/like/like_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelReadingBottomToolbar extends ConsumerStatefulWidget {
  const NovelReadingBottomToolbar(this.showComments,
      {super.key,
      required this.workContent,
      required this.onToggleLike,
      required this.onCommentIconClicked});

  final bool showComments;
  final WorkContent workContent;
  final void Function() onToggleLike;
  final void Function() onCommentIconClicked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelReadingTopToolbar();
  }
}

class _NovelReadingTopToolbar extends ConsumerState<NovelReadingBottomToolbar> {
  List<bool> _likeStates = [false];
  late UserViewModel _userViewModel;
  late LikeViewModel _likeViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _likeViewModel = ref.read(likeViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = _userViewModel.currentUid;
      if (userId != null) {
        _likeViewModel.checkLike(userId, widget.workContent.contentDetailId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultColor = Colors.white;
    final selectedColor = Colors.blue;

    _likeStates = ref.watch(likeViewModelProvider).when(
        loading: () => _likeStates,
        success: (data) => data == null ? _likeStates : [data],
        error: (e) => _likeStates);

    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: defaultColor),
            onPressed: () {
              // 이전 화로 이동
            },
          ),
          ToggleButtons(
            isSelected: _likeStates,
            renderBorder: false,
            color: defaultColor,
            selectedColor: selectedColor,
            fillColor: Colors.transparent,
            onPressed: (idx) {
              final userId = _userViewModel.currentUid;
              widget.onToggleLike();
              if (userId != null) {
                _likeViewModel.toggleLike(Like(
                    likeId: uuid.v4(),
                    userId: userId,
                    workContentType: widget.workContent is Episode ? "episode" : "notice",
                    contentDetailId: widget.workContent.contentDetailId,
                    workId: widget.workContent.workId));
              }
            },
            children: <Widget>[
              Icon(Icons.thumb_up),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.comment,
              color: widget.showComments ? selectedColor : defaultColor,
            ),
            onPressed: () {
              // 댓글 기능 추가
              widget.onCommentIconClicked();
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: defaultColor),
            onPressed: () {
              // 다음 화로 이동
            },
          ),
        ],
      ),
    );
  }
}
