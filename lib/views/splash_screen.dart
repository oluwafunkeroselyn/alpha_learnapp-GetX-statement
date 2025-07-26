import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_learnapp/views/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animation controller for 2 seconds
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Tween for fade-in effect from 0 (transparent) to 1 (opaque)
    _fadeAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();  // start animation

    // After 3 seconds, navigate to WelcomeScreen
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const WelcomeScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();  // Dispose animation controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500,
                child: Image.asset('assets/images/a for alpha.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to \nAlpha Learn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
