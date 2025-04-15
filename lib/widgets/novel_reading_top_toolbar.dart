import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/viewmodels/favorite/toggle_favorite_viewmodel_provider.dart';

class NovelReadingTopToolbar extends ConsumerStatefulWidget {
  const NovelReadingTopToolbar(
      {super.key, required this.title, required this.onToggleFavorite});

  final String title;
  final void Function() onToggleFavorite;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelReadingTopToolbar();
  }
}

class _NovelReadingTopToolbar extends ConsumerState<NovelReadingTopToolbar> {
  List<bool> _toggleButtonsStates = [false];

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
              widget.title,
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
