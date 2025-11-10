import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  ExamListScreen({Key? key}) : super(key: key);

  final List<Exam> exams = [
    Exam(subject: 'Мобилни информатички системи', dateTime: DateTime(2025, 12, 22, 10, 0), rooms: ['A1', 'A2']),
    Exam(subject: 'Вештачка интелигенција', dateTime: DateTime(2025, 12, 24, 12, 0), rooms: ['Lab 3']),
    Exam(subject: 'Бази на податоци', dateTime: DateTime(2025, 12, 28, 9, 30), rooms: ['A3']),
    Exam(subject: 'Интернет технологии', dateTime: DateTime(2026, 1, 3, 11, 0), rooms: ['B1']),
    Exam(subject: 'Софтверско инженерство', dateTime: DateTime(2026, 1, 5, 14, 0), rooms: ['A2']),
    Exam(subject: 'Компјутерски мрежи', dateTime: DateTime(2026, 1, 8, 9, 0), rooms: ['Lab 2']),
    Exam(subject: 'Оперативни системи', dateTime: DateTime(2026, 1, 12, 12, 0), rooms: ['A1']),
    Exam(subject: 'Информациски системи', dateTime: DateTime(2026, 1, 15, 10, 30), rooms: ['Lab 1']),
    Exam(subject: 'Програмирање 1', dateTime: DateTime(2026, 1, 18, 9, 0), rooms: ['A3']),
    Exam(subject: 'Програмирање 2', dateTime: DateTime(2026, 1, 21, 13, 0), rooms: ['Lab 4']),
  ];

  @override
  Widget build(BuildContext context) {
    // Подреди ги испитите по датум
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 222115'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final isPast = exam.dateTime.isBefore(DateTime.now());
                final color = isPast ? Colors.grey[300] : Colors.white;

                return Card(
                  color: color,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.school, color: isPast ? Colors.grey : Colors.blue),
                    title: Text(exam.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16, color: Colors.blue),
                            const SizedBox(width: 5),
                            Text(
                              '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} '
                                  '${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16, color: Colors.red),
                            const SizedBox(width: 5),
                            Text(exam.rooms.join(', ')),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamDetailScreen(exam: exam),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blue[50],
            child: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
