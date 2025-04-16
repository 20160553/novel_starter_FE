import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/favorite/favorite_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/favorite/favorite_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelReadingTopToolbar extends ConsumerStatefulWidget {
  const NovelReadingTopToolbar(
      {super.key, required this.workContent, required this.onToggleFavorite});

  final WorkContent workContent;
  final void Function() onToggleFavorite;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelReadingTopToolbar();
  }
}

class _NovelReadingTopToolbar extends ConsumerState<NovelReadingTopToolbar> {
  List<bool> _toggleButtonsStates = [false];
  late UserViewModel _userViewModel;
  late FavoriteViewModel _toggleFavoriteViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _toggleFavoriteViewModel =
        ref.read(toggleFavoriteViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = _userViewModel.currentUid;
      if (userId != null) {
        _toggleFavoriteViewModel.checkFavorite(userId, widget.workContent.workId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultColor = Colors.white;
    final selectedColor = Colors.blue;

    _toggleButtonsStates = ref.watch(toggleFavoriteViewModelProvider).when(
        loading: () => _toggleButtonsStates,
        success: (data) => data == null ? _toggleButtonsStates : [data],
        error: (e) => _toggleButtonsStates);

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
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: () {
              // 회차 목록으로 이동
            },
          ),
          ToggleButtons(
            isSelected: _toggleButtonsStates,
            onPressed: (idx) {
              setState(() {
                _toggleButtonsStates[idx] = !_toggleButtonsStates[idx];
              });
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
