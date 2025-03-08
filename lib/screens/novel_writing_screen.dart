import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/create_work_content_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/manage_work_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/create_work_content_viewmodel.dart';
import 'package:novel_starter/viewmodels/manage_work_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelWritingScreen extends ConsumerStatefulWidget {
  const NovelWritingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelWritingScreen();
  }
}

class _NovelWritingScreen extends ConsumerState<NovelWritingScreen> {
  late final CreateWorkContentViewModel _createWorkContentViewModel;
  late final ManageWorkViewModel _manageWorkViewModel;
  late final UserViewModel _userViewModel;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  bool isNotice = false;
  Work? selected;

  @override
  void initState() {
    super.initState();
    _createWorkContentViewModel =
        ref.read(createWorkContentViewModelProvider.notifier);
    _manageWorkViewModel = ref.read(manageWorkViewModelProvider.notifier);
    _userViewModel = ref.read(userViewModelProvider.notifier);

    String? currentUid = _userViewModel.currentUid;
    if (currentUid == null) {
      Navigator.pop(context);
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => _manageWorkViewModel.getWorksByUserId(currentUid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Work> works =
        ref.watch(manageWorkViewModelProvider.select((apiState) {
      return apiState.when(
          loading: () => [], success: (data) => data ?? [], error: (e) => []);
    }));
    ref.listen(createWorkContentViewModelProvider, (perv, next) {
      next.when(
          loading: () {},
          success: (data) {
            if (data != null) {
              String snackBarMsg = "";
              if (data is Episode) {
                snackBarMsg = "회차 등록에 성공했습니다";
              } else {
                snackBarMsg = "공지지 등록에 성공했습니다";
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(snackBarMsg),
                  duration: Duration(seconds: 1),
                ),
              );
              Navigator.pop(context);
            }
          },
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("작성 중 문제가 발생했습니다"),
                duration: Duration(seconds: 1),
              ),
            );
          });
    });
    final currentUid = _userViewModel.currentUid;

    return Scaffold(
      appBar: AppBar(
        title: Text('소설 작성'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 작품 선택
              DropdownButtonFormField<Work>(
                decoration: InputDecoration(
                  labelText: '작품 선택',
                  border: OutlineInputBorder(),
                ),
                items: works
                    .map((work) => DropdownMenuItem(
                          value: work,
                          child: Text(work.title),
                        ))
                    .toList(),
                onChanged: (value) {
                  // 작품 선택 로직
                  setState(() {
                    selected = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // 회차 제목
              TextField(
                decoration: InputDecoration(
                  labelText: '회차 제목',
                  border: OutlineInputBorder(),
                ),
                controller: _titleController,
              ),
              SizedBox(height: 16),

              // 공지로 등록 여부
              Row(
                children: [
                  Checkbox(
                    value: isNotice,
                    onChanged: (bool? value) {
                      // 공지 여부 로직
                      setState(() {
                        isNotice = value!;
                      });
                    },
                  ),
                  Text('공지로 등록')
                ],
              ),
              SizedBox(height: 16),

              // 글 작성
              TextField(
                maxLines: 10,
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '글 작성',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // 작가 코멘트 작성
              TextField(
                maxLines: 5,
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: '작가 코멘트',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // 제출 버튼
              ElevatedButton(
                onPressed: () {
                  // 제출 로직
                  if (currentUid == null || selected == null) return;
                  DateTime now = DateTime.now();
                  if (isNotice) {
                    _createWorkContentViewModel.createWorkContent(WorkContent.notice(
                        title: _titleController.text,
                        content: _contentController.text,
                        comment: _commentController.text,
                        createdAt: now,
                        updatedAt: now,
                        workId: selected!.workId,
                        userId: currentUid,
                        noticeId: uuid.v4()));
                  } else {
                    _createWorkContentViewModel.createWorkContent(WorkContent.episode(
                        title: _titleController.text,
                        content: _contentController.text,
                        comment: _commentController.text,
                        createdAt: now,
                        updatedAt: now,
                        workId: selected!.workId,
                        userId: currentUid,
                        episodeId: uuid.v4()));
                  }
                },
                child: Text('작성 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
