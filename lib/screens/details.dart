import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/exam.dart';
import '../widgets/detail_card.dart';

class DetailsPage extends StatefulWidget {
  final Exam exam;

  const DetailsPage({super.key, required this.exam});

  @override
  State<StatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Детали за испит - 221054"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: DetailedCard(exam: widget.exam),
      ),
    );
  }
}
