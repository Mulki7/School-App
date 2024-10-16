import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  final String userName;

  const MyAccountScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Account', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Profile and content
          Column(
            children: [
              const SizedBox(height: 100), // Spacing for the AppBar
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/opang.jpg'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                userName,  // Gunakan userName di sini
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'mulkiaziz406@gmail.com', // Bisa diganti dinamis jika perlu
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        _buildInfoCard(Icons.person, 'Nama Lengkap', userName), // Menggunakan userName
                        _buildInfoCard(Icons.badge, 'NIP', '1987654321'),
                        _buildInfoCard(Icons.book, 'Mata Pelajaran', 'Matematika'),
                        _buildInfoCard(Icons.date_range, 'Tanggal Bergabung', '01 Juli 2010'),
                        _buildInfoCard(Icons.home, 'Alamat', 'Jl. Guru No. 123, Kota Pendidikan'),
                        _buildInfoCard(Icons.phone, 'Nomor Telepon', '081234567890'),
                        _buildInfoCard(Icons.email, 'Email', 'mulkiaziz406@gmail.com'),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Implement edit profile functionality
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text(
                            'Edit Profil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepOrange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.deepOrange, size: 30),
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
