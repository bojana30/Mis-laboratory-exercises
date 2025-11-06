import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam});

  final Exam exam;

  Color cardColor() => exam.dateTime.isBefore(DateTime.now())
      ? Colors.pink.shade200
      : Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: cardColor(),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                exam.subjectName,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month, size: 18, color: Colors.black),
                  SizedBox(width: 6),
                  Text(
                    "${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} "
                    "во ${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.place, size: 18, color: Colors.black),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
