import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grades', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 5, // Ganti dengan jumlah mata pelajaran yang sebenarnya
          itemBuilder: (context, index) {
            return _buildGradeItem('Subject ${index + 1}', 85 + index);
          },
        ),
      ),
    );
  }

  Widget _buildGradeItem(String subject, int grade) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getGradeDescription(grade),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _getGradeColor(grade),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                grade.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(int grade) {
    if (grade >= 90) return Colors.green;
    if (grade >= 80) return Colors.orange;
    if (grade >= 70) return Colors.blue;
    return Colors.red;
  }

  String _getGradeDescription(int grade) {
    if (grade >= 90) return 'Excellent';
    if (grade >= 80) return 'Good';
    if (grade >= 70) return 'Satisfactory';
    return 'Needs Improvement';
  }
}
