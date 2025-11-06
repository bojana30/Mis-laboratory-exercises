class Exam {
  final String subjectName;
  final DateTime dateTime;
  List<String> rooms;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });

  Exam.fromJson(Map<String, dynamic> exams)
    : subjectName = exams['name'],
      dateTime = exams['datetime'],
      rooms = exams['rooms'];
}
