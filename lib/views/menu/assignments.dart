import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments', style: TextStyle(color: Colors.white)),
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
          itemCount: 5, // Ganti dengan jumlah tugas yang sebenarnya
          itemBuilder: (context, index) {
            return _buildAssignmentItem(
              'Assignment ${index + 1}',
              'Subject ${index + 1}',
              DateTime.now().add(Duration(days: index + 1)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add new assignment functionality
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAssignmentItem(String title, String subject, DateTime dueDate) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subject,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due: ${_formatDate(dueDate)}',
                  style: TextStyle(
                    color: _getDueDateColor(dueDate),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getDueDateColor(dueDate),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getRemainingDays(dueDate),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getRemainingDays(DateTime dueDate) {
    final difference = dueDate.difference(DateTime.now()).inDays;
    if (difference == 0) {
      return 'Due today';
    } else if (difference < 0) {
      return 'Overdue';
    } else {
      return '$difference days left';
    }
  }

  Color _getDueDateColor(DateTime dueDate) {
    final difference = dueDate.difference(DateTime.now()).inDays;
    if (difference < 0) {
      return Colors.red;
    } else if (difference <= 1) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
