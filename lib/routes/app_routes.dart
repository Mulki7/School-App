import 'package:flutter/material.dart';
import '../views/auth/login_page.dart';
import '../splashscreen.dart';
import '../views/home/welcome_page.dart';
import '../views/auth/register_page.dart';
import '../views/home/home.dart';
import '../views/menu/my_account.dart';
import '../views/menu/library.dart';
import '../views/menu/student_list.dart';   
import '../views/menu/schedule.dart';
import '../views/menu/grades.dart';
import '../views/menu/assignments.dart';

class AppRoutes {
  static const String login = '/';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String home = '/';
  static const String myAccount = '/my-account';
  static const String library = '/library';
  static const String studentList = '/student-list';
  static const String schedule = '/schedule';
  static const String grades = '/grades';
  static const String assignments = '/assignments';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    splash: (context) => const SplashScreen(),
    welcome: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      final userName = args?['userName'] as String? ?? '';
      return WelcomeScreen(userName: userName);
    },
    register: (context) => const RegisterScreen(),
  };

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(userName: 'User Name'), // Replace with actual user name
      myAccount: (context) => const MyAccountScreen(userName: 'User Name'),
      library: (context) => const LibraryScreen(),
      studentList: (context) => const StudentListScreen(),
      schedule: (context) => const ScheduleScreen(),
      grades: (context) => const GradesScreen(),
      assignments: (context) => const AssignmentsScreen(),
    };
  }
}
