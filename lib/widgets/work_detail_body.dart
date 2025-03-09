import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/viewmodels/get_episodes_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/get_notices_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/get_episodes_viewmodel.dart';
import 'package:novel_starter/viewmodels/get_notices_viewmodel.dart';
import 'package:novel_starter/widgets/work_content_list_tile.dart';

class WorkDetailBody extends ConsumerStatefulWidget {
  const WorkDetailBody({super.key, required this.work});

  final Work work;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WorkDetailBody();
  }
}

class _WorkDetailBody extends ConsumerState<WorkDetailBody> {
  late final GetNoticesViewModel _getNoticesViewModel;
  late final GetEpisodesViewModel _getEpisodesViewModel;

  @override
  void initState() {
    super.initState();
    _getNoticesViewModel = ref.read(getNoticesViewModelProvider.notifier);
    _getEpisodesViewModel = ref.read(getEpisodesViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getNoticesViewModel.getNoticesByWorkId(widget.work.workId);
      _getEpisodesViewModel.getEpisodesbyWorkId(widget.work.workId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Notice> notices = ref.watch(getNoticesViewModelProvider).when(loading: () => [], success: (data) {
      return data ?? [];
    }, error: (_) => []);
    final List<Episode> episodes = ref.watch(getEpisodesViewModelProvider).when(loading: () => [], success: (data) {
      return data ?? [];
    }, error: (_) => []);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '공지사항',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...notices.map((notice) => WorkContentListTile(workContent: notice)),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '회차 목록',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...episodes.map((episode) => WorkContentListTile(workContent: episode)),
      ],
    );
  }
}
