import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';
import 'info.dart';
import 'agenda.dart';
import 'galery.dart';

class WelcomeScreen extends StatefulWidget {
  final String userName;

  const WelcomeScreen({super.key, required this.userName});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(userName: widget.userName),
      const InfoScreen(),
      const AgendaScreen(),
      const GaleriScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30, color: _selectedIndex == 0 ? Colors.white : Colors.white),
      Icon(Icons.info, size: 30, color: _selectedIndex == 1 ? Colors.white : Colors.white),
      Icon(Icons.calendar_today, size: 30, color: _selectedIndex == 2 ? Colors.white : Colors.white),
      Icon(Icons.photo_library, size: 30, color: _selectedIndex == 3 ?Colors.white : Colors.white),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60,
        backgroundColor: const Color.fromARGB(255, 255, 224, 178),
        color: Colors.orange,
        buttonBackgroundColor: Colors.deepOrange,
        items: items,
        onTap: _onItemTapped,
        animationDuration: const Duration(milliseconds: 400),
        animationCurve: Curves.easeInOut,
      ),
    );
  }
}