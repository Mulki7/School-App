import 'package:flutter/material.dart';
import '../menu/my_account.dart'; // Import halaman MyAccount
import '../menu/library.dart'; // Import halaman Library
import '../menu/student_list.dart'; // Import halaman Daftar Siswa
import '../menu/schedule.dart'; // Import halaman Jadwal
import '../menu/grades.dart'; // Import halaman Nilai
import '../menu/assignments.dart'; // Import halaman Tugas

class HomeScreen extends StatelessWidget {
  final String userName;
  
  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      drawer: Drawer(
        child: Container(
          color: Colors.orange[100],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person, size: 40, color: Colors.orange),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.orange),
                title: Text('Beranda', style: TextStyle(color: Colors.orange[800])),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.orange),
                title: Text('Pengaturan', style: TextStyle(color: Colors.orange[800])),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle, color: Colors.orange),
                title: Text('Akun Saya', style: TextStyle(color: Colors.orange[800])),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.orange[200]),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.red),
                title: const Text('Keluar', style: TextStyle(color: Colors.red)),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Konfirmasi'),
                        content: const Text('Apakah Anda ingin keluar dari akun ini?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Tidak', style: TextStyle(color: Colors.orange)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Ya', style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacementNamed(context, '/');
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Icon(Icons.person, size: 30, color: Colors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Selamat datang, $userName',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Last Update 25 Feb 2024',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: [
                      DashboardItem(
                        icon: Icons.account_circle,
                        label: 'My Account',
                        color: Colors.orange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAccountScreen(userName: userName)),
                          );
                        },
                      ),
                      DashboardItem(
                        icon: Icons.book,
                        label: 'Library',
                        color: Colors.deepOrange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LibraryScreen()),
                          );
                        },
                      ),
                      DashboardItem(
                        icon: Icons.person,
                        label: 'Daftar Siswa',
                        color: Colors.orangeAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const StudentListScreen()),
                          );
                        },
                      ),
                      DashboardItem(
                        icon: Icons.timelapse,
                        label: 'Jadwal',
                        color: Colors.amber,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ScheduleScreen()),
                          );
                        },
                      ),
                      DashboardItem(
                        icon: Icons.star,
                        label: 'Nilai',
                        color: Colors.deepOrange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GradesScreen()),
                          );
                        },
                      ),
                      DashboardItem(
                        icon: Icons.task,
                        label: 'Tugas',
                        color: Colors.orange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AssignmentsScreen()),
                          );
                        },
                      ),
                    ],
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

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const DashboardItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
