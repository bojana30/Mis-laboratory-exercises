import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/exam.dart';

class DetailedCard extends StatefulWidget {
  final Exam exam;

  const DetailedCard({super.key, required this.exam});

  @override
  State<StatefulWidget> createState() => _DetailedCardState();
}

class _DetailedCardState extends State<DetailedCard> {
  String timeLeft() {
    final now = DateTime.now();
    final examDate = widget.exam.dateTime;
    if (examDate.isBefore(now)) {
      return "Испитот е завршен.";
    }
    final difference = examDate.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    return "Испитот е за: $days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.exam.subjectName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month, size: 22, color: Colors.pink),
                  SizedBox(width: 12),
                  Text(
                    "${widget.exam.dateTime.day.toString().padLeft(2, '0')}/"
                    "${widget.exam.dateTime.month.toString().padLeft(2, '0')}/"
                    "${widget.exam.dateTime.year}  во  "
                    "${widget.exam.dateTime.hour.toString().padLeft(2, '0')}:"
                    "${widget.exam.dateTime.minute.toString().padLeft(2, '0')} ",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Icon(Icons.access_time, size: 22, color: Colors.pink),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      alignment: WrapAlignment.center,
                      children: widget.exam.rooms.map((room) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.pink, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.pink,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                room,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                child: Text(
                  timeLeft(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
