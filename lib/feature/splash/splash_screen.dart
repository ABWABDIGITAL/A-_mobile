
import 'dart:async';
import 'package:a_plus/feature/welcome/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/widgets/primary/my_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: const Center(
        child: MySvg(
          image: "logo",
          height: 200,
          width: 180,
        ),
      ),
    );
  }
}