import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/providers/viewmodels/get_work_content_detail_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/get_work_content_detail_viewmodel.dart';

class NovelReadingScreen extends ConsumerStatefulWidget {
  const NovelReadingScreen({required this.workContentDetailId, super.key});
  final String workContentDetailId;
  
  @override
  ConsumerState<NovelReadingScreen> createState() => _NovelReadingScreenState();  
}

class _NovelReadingScreenState extends ConsumerState<NovelReadingScreen> {
  bool _showToolbar = false;
  Timer? _toolbarTimer;
  
  late GetWorkContentDetailViewmodel _getWorkContentDetailViewmodel;

  @override
  void initState() {
    super.initState();
    _getWorkContentDetailViewmodel = ref.read(getWorkContentDetailViewmodelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWorkContentDetailViewmodel.getWorkContentDetailById(widget.workContentDetailId);
    });
  }

  void _toggleToolbar() {
    setState(() {
      _showToolbar = !_showToolbar;
    });

    if (_showToolbar) {
      _toolbarTimer?.cancel();
      _toolbarTimer = Timer(Duration(seconds: 3), () {
        setState(() {
          _showToolbar = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _toolbarTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WorkContentDetail? workContentDetail = ref.watch(getWorkContentDetailViewmodelProvider).when(error: (_) => null, loading: () => null, success: (data) => data,);

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
                  Container(
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
                            widget.workContentDetailId,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.list, color: Colors.white),
                          onPressed: () {
                            // 회차 목록으로 이동
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite, color: Colors.white),
                          onPressed: () {
                            // 선호작 기능 추가
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
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
                          icon: Icon(Icons.comment, color: Colors.white),
                          onPressed: () {
                            // 댓글 기능 추가
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
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
