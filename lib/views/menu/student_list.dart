import 'package:flutter/material.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> students = [
      {'name': 'Ahmad Rahmat', 'className': 'Kelas 1'},
      {'name': 'Siti Aisyah', 'className': 'Kelas 2'},
      {'name': 'Budi Santoso', 'className': 'Kelas 3'},
      {'name': 'Dewi Kartika', 'className': 'Kelas 1'},
      {'name': 'Rudi Hartono', 'className': 'Kelas 2'},
      {'name': 'Fitri Andini', 'className': 'Kelas 3'},
      {'name': 'Hadi Setiawan', 'className': 'Kelas 1'},
      {'name': 'Nina Agustina', 'className': 'Kelas 2'},
      {'name': 'Indra Kurniawan', 'className': 'Kelas 3'},
      {'name': 'Maya Putri', 'className': 'Kelas 1'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Siswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 8,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrangeAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemCount: students.length,
          itemBuilder: (context, index) {
            return _buildStudentItem(
              students[index]['name']!,
              students[index]['className']!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildStudentItem(String name, String className) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          // TODO: Implement view student details
        },
        splashColor: Colors.orange.withOpacity(0.3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.orangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              className,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.deepOrange),
              onPressed: () {
                // TODO: Implement options menu (e.g., view details, edit, etc.)
              },
            ),
          ),
        ),
      ),
    );
  }
}
