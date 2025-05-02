import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/favorite/favorite_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/favorite/favorite_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelReadingTopToolbar extends ConsumerStatefulWidget {
  const NovelReadingTopToolbar(
    this._showWorkContents,
      {super.key, required this.workContent, required this.onToggleFavorite, required this.onToggleWorkContentsLayout});

  final bool _showWorkContents;
  final WorkContent workContent;
  final void Function() onToggleFavorite;
  final void Function() onToggleWorkContentsLayout;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelReadingTopToolbar();
  }
}

class _NovelReadingTopToolbar extends ConsumerState<NovelReadingTopToolbar> {
  List<bool> _favoriteStates = [false];
  late UserViewModel _userViewModel;
  late FavoriteViewModel _favoriteViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _favoriteViewModel =
        ref.read(favoriteViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = _userViewModel.currentUid;
      if (userId != null) {
        _favoriteViewModel.checkFavorite(userId, widget.workContent.workId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultColor = Colors.white;
    final selectedColor = Colors.blue;

    _favoriteStates = ref.watch(favoriteViewModelProvider).when(
        loading: () => _favoriteStates,
        success: (data) => data == null ? _favoriteStates : [data],
        error: (e) => _favoriteStates);

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
              widget.workContent.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          IconButton(
            icon: Icon(Icons.list, color: widget._showWorkContents ? selectedColor : defaultColor),
            onPressed: () {
              widget.onToggleWorkContentsLayout();
            },
          ),
          ToggleButtons(
            isSelected: _favoriteStates,
            onPressed: (idx) {
              widget.onToggleFavorite();
            },
            renderBorder: false,
            color: defaultColor,
            selectedColor: selectedColor,
            fillColor: Colors.transparent,
            children: <Widget>[
              Icon(
                Icons.favorite,
              ),
            ],
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
