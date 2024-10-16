import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttermg4_tugas/views/auth/login_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Atur posisi di tengah
        children: [
          Expanded(
            child: Center(
              child: LottieBuilder.asset(
                "assets/lottie/Animation - 1728840787980.json",
                fit: BoxFit.contain, // Pastikan animasi sesuai ukuran layar
              ),
            ),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 250, // Sesuaikan ukuran splash
      backgroundColor: Colors.white,
      duration: 3000, // Tambahkan durasi jika diperlukan
    );
  }
}
