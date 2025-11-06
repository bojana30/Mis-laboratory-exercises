import 'package:flutter/material.dart';
import 'package:projects_android_studio/screens/details.dart';
import 'package:projects_android_studio/screens/home.dart';

import 'models/exam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratory 1 - MIS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade400),
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Распоред за испити"),
          );
        } else if (settings.name == "/details") {
          final exam = settings.arguments as Exam;
          return MaterialPageRoute(
            builder: (context) => DetailsPage(exam: exam),
          );
        }
      },
    );
  }
}
