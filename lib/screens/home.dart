import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/exam.dart';
import '../widgets/exam_grid.dart';
import '../widgets/total_exams.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> exams = [
    Exam(
      subjectName: "Веројатност и статистика",
      dateTime: DateTime(2025, 11, 5, 8, 0),
      rooms: ["Б1", "Б1.2", "Б2"],
    ),
    Exam(
      subjectName: "Дигитализација",
      dateTime: DateTime(2025, 11, 5, 12, 0),
      rooms: ["амф Финки", "амф МФ"],
    ),
    Exam(
      subjectName: "Веб програмирање",
      dateTime: DateTime(2025, 11, 12, 12, 0),
      rooms: ["амф Финки"],
    ),
    Exam(
      subjectName: "Напредно програмирање",
      dateTime: DateTime(2025, 11, 15, 13, 30),
      rooms: ["315", "215"],
    ),
    Exam(
      subjectName: "Интегрирани системи",
      dateTime: DateTime(2025, 11, 17, 15, 30),
      rooms: ["Б1", "Б2.1", "Б3.1"],
    ),
    Exam(
      subjectName: "Физика",
      dateTime: DateTime(2025, 11, 19, 8, 30),
      rooms: ["тмф 115", "тмф 116"],
    ),
    Exam(
      subjectName: "Бази на податоци",
      dateTime: DateTime(2025, 11, 20, 10, 0),
      rooms: ["Б3.2", "Б3.1"],
    ),
    Exam(
      subjectName: "Мобилни информациски системи",
      dateTime: DateTime(2025, 11, 22, 9, 0),
      rooms: ["Б2.1", "B3.1"],
    ),
    Exam(
      subjectName: "Сајбер безбедност",
      dateTime: DateTime(2025, 11, 24, 12, 0),
      rooms: ["Б1"],
    ),
    Exam(
      subjectName: "Структурно програмирање",
      dateTime: DateTime(2025, 11, 29, 9, 0),
      rooms: ["223", "224"],
    ),
  ];

  @override
  void initState() {
    super.initState();
    exams.sort((x, y) => x.dateTime.compareTo(y.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.title} - 221054'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView.builder(
          itemCount: exams.length + 1,
          itemBuilder: (context, index) {
            if (index < exams.length) {
              return ExamGrid(exams: [exams[index]]);
            } else {
              return TotalExams(exams: exams);
            }
          },
        ),
      ),
    );
  }
}
