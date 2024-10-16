import 'dart:ui';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Senin sampai Jumat
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Schedule',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu'),
              Tab(text: 'Fri'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange, Colors.white],
            ),
          ),
          child: TabBarView(
            children: [
              _buildDaySchedule('Monday'),
              _buildDaySchedule('Tuesday'),
              _buildDaySchedule('Wednesday'),
              _buildDaySchedule('Thursday'),
              _buildDaySchedule('Friday'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDaySchedule(String day) {
    // Contoh jadwal, ganti dengan data sebenarnya
    final schedule = [
      {'time': '08:00 - 09:30', 'subject': 'Mathematics'},
      {'time': '09:45 - 11:15', 'subject': 'Science'},
      {'time': '11:30 - 13:00', 'subject': 'English'},
      {'time': '13:45 - 15:15', 'subject': 'History'},
    ];

    return ListView.builder(
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        final lesson = schedule[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                // Glassmorphism background
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                // Card content
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.schedule,
                          color: Colors.orange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              lesson['subject']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              lesson['time']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
