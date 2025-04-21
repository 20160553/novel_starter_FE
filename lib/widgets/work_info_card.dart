import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/viewmodels/work_detail_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/work_detail_viewmodel.dart';

class WorkInfoCard extends ConsumerStatefulWidget {
  const WorkInfoCard({super.key, required this.work});

  final Work work;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WorkInfoCard();
  }
}

class _WorkInfoCard extends ConsumerState<WorkInfoCard> {
  
  late WorkDetailViewModel _workDetailViewModel;
  
  @override
  void initState() {
    super.initState();
    _workDetailViewModel = ref.read(workDetailViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _workDetailViewModel.getWorkByWorkId(widget.work.workId);
    });

  }

  @override
  Widget build(BuildContext context) {
    Work work = widget.work;
    work = ref.watch(workDetailViewModelProvider).when(loading: () => work, success: (data) {
      return data ?? work;
    }, error: (e) => work);
    
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              work.thumbnailImgUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                work.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '작가: authorName',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                '연재 주기: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '등록된 회차: ${work.episodeCount}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '조회: 100만',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '선호작: ${work.favoriteCount}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '추천: ${work.likeCount}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
