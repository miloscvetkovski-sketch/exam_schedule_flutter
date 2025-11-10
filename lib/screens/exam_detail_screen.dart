import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours.remainder(24);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Предмет: ${exam.subject}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              'Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 16),
            ),
            Text('Простории: ${exam.rooms.join(', ')}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Преостанато време до испитот:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('$days дена, $hours часа',
                style: const TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
