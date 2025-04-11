import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/constants/string.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/widgets/work_card.dart';

class StudyScreen extends ConsumerStatefulWidget {
  const StudyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StudyScreen();
  }

}

class _StudyScreen extends ConsumerState {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final List<Work> works = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(studyScreenString),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: works.length,
              itemBuilder: (context, index) {
                return WorkCard(works[index]);
              },
            )
      ),
    );
  }
}