import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/viewmodels/work/get_works_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/get_works_viewmodel.dart';
import 'package:novel_starter/widgets/work_card.dart';

class BookShelfScreen extends ConsumerStatefulWidget {
  const BookShelfScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WorkStandScreen();
  }
}

class _WorkStandScreen extends ConsumerState<BookShelfScreen> {
  late final GetWorksViewModel _getWorksViewModel;

  late final ScrollController _scrollController;
  List<Work> works = [];

  void _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll) {
      _getWorksViewModel.getWorksSortedByTime(false);
    }
  }

  @override
  void initState() {
    super.initState();
    _getWorksViewModel = ref.read(getWorksViewModelProvider.notifier);

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getWorksViewModel.refresh());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiState = ref.watch(getWorksViewModelProvider);
    works = ref.watch(getWorksViewModelProvider).when(
        loading: () => works,
        success: (data) {
          return data ?? works;
        },
        error: (e) => []);
    return Scaffold(
        appBar: AppBar(
          title: Text("studyScreenString"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return WorkCard(works[index]);
                },
                controller: _scrollController,
              ),
            ),
            if (apiState is LoadingState)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ));
  }
}
