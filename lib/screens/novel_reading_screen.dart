import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/favorite.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/providers/viewmodels/favorite/favorite_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/get_work_content_detail_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/favorite/favorite_viewmodel.dart';
import 'package:novel_starter/viewmodels/get_work_content_detail_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';
import 'package:novel_starter/widgets/comment_layout.dart';
import 'package:novel_starter/widgets/novel_reading_bottom_toolbar.dart';
import 'package:novel_starter/widgets/novel_reading_top_toolbar.dart';
import 'package:novel_starter/widgets/work_detail_body.dart';

class NovelReadingScreen extends ConsumerStatefulWidget {
  const NovelReadingScreen(
      {required this.work, required this.workContent, super.key});
  final WorkContent workContent;
  final Work work;

  @override
  ConsumerState<NovelReadingScreen> createState() => _NovelReadingScreenState();
}

class _NovelReadingScreenState extends ConsumerState<NovelReadingScreen> {
  bool _showToolbar = false;
  bool _showComments = false;
  bool _showWorkContents = false;
  Timer? _toolbarTimer;

  late GetWorkContentDetailViewmodel _getWorkContentDetailViewmodel;
  late UserViewModel _userViewModel;
  late FavoriteViewModel _toggleFavoriteViewModel;

  @override
  void initState() {
    super.initState();
    _getWorkContentDetailViewmodel =
        ref.read(getWorkContentDetailViewmodelProvider.notifier);
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _toggleFavoriteViewModel = ref.read(favoriteViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWorkContentDetailViewmodel
          .getWorkContentDetailById(widget.workContent.contentDetailId);
    });
  }

  void _toggleToolbar() {
    setState(() {
      _showToolbar = !_showToolbar;
      _showComments = false;
    });

    if (_showToolbar) {
      _timerCancel();
      _toolbarTimer = Timer(Duration(seconds: 3), () {
        setState(() {
          _showToolbar = false;
        });
      });
    }
  }

  void _toggleWorkContents() {
    _timerCancel();
    setState(() {
      _showComments = false;
      _showWorkContents = !_showWorkContents;
      _showToolbar = true;
    });
  }

  void _toggleComments() {
    _timerCancel();
    setState(() {
      _showWorkContents = false;
      _showComments = !_showComments;
      _showToolbar = true;
    });
  }

  void _toggleFavorite() {
    _timerCancel();
    final userId = _userViewModel.currentUid;
    if (userId != null) {
      _toggleFavoriteViewModel.toggleFavorite(Favorite(
          userId: userId,
          workId: widget.workContent.workId,
          favoriteId: uuid.v4()));
    }
  }

  void _timerCancel() {
    _toolbarTimer?.cancel();
  }

  @override
  void dispose() {
    _timerCancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WorkContentDetail? workContentDetail =
        ref.watch(getWorkContentDetailViewmodelProvider).when(
              error: (_) => null,
              loading: () => null,
              success: (data) => data,
            );

    return GestureDetector(
      onTap: _toggleToolbar,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        workContentDetail?.body ?? "",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showToolbar)
              Column(
                children: [
                  NovelReadingTopToolbar(
                    _showWorkContents,
                    workContent: widget.workContent,
                    onToggleFavorite: () {
                      _toggleFavorite();
                    },
                    onToggleWorkContentsLayout: () => _toggleWorkContents(),
                  ),
                  if (_showComments) CommentLayout(widget.workContent),
                  if (_showWorkContents)
                    Expanded(
                        child: SingleChildScrollView(
                            child: WorkDetailBody(work: widget.work))),
                  if (!(_showComments || _showWorkContents)) Spacer(),
                  NovelReadingBottomToolbar(
                    _showComments,
                    work: widget.work,
                    onCommentIconClicked: () => _toggleComments(),
                    workContent: widget.workContent,
                    onToggleLike: () {
                      _timerCancel();
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
