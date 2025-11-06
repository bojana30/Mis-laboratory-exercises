import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/exam.dart';

class TotalExams extends StatefulWidget {
  const TotalExams({super.key, required this.exams});

  final List<Exam> exams;

  @override
  State<StatefulWidget> createState() => _TotalExamsState();
}

class _TotalExamsState extends State<TotalExams> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.pink.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          "Вкупно испити: ${widget.exams.length}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
