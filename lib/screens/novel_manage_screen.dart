import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/viewmodels/work/manage_work_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/manage_work_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';
import 'package:novel_starter/widgets/work_manage_card.dart';

class NovelManageScreen extends ConsumerStatefulWidget {
  const NovelManageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelManageScreen();
  }
}

class _NovelManageScreen extends ConsumerState<NovelManageScreen> {
  late final ManageWorkViewModel _manageWorkViewModel;
  late final UserViewModel _userViewModel;
  @override
  void initState() {
    super.initState();
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
    final List<Work> works = ref.watch(manageWorkViewModelProvider).when(
        loading: () => [],
        success: (data) {
          return data ?? [];
        },
        error: (e) => []);

    return Scaffold(
      appBar: AppBar(
        title: Text('내 작품 관리'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: works.length, // 등록된 작품 수 (예시)
        itemBuilder: (context, index) {
          return WorkManageCard(works[index], onDeleteWork: (work) {
            _manageWorkViewModel.deleteWork(work);
          },);
        },
      ),
    );
  }
}
