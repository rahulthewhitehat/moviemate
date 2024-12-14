import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    // Navigate after the splash screen
    Future.delayed(const Duration(seconds: 3), () {
      _navigateBasedOnAuth(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateBasedOnAuth(BuildContext context) async {
    // Navigate to the appropriate screen after the splash
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background to black (Netflix-like)
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo with scaling animation
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      'assets/logo.png', // Ensure you have a logo image
                      height: 150, // Adjust the height accordingly
                    ),
                  ),
                  const SizedBox(height: 20),
                  // App name with a bold font and fade-in effect
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      'MovieMate', // Customize the app name
                      style: TextStyle(
                        fontSize: 50, // Adjusted to match logo size better
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // Netflix red color
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Tagline or description text with fade-in effect
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      'Bringing Stories to Life',
                      style: TextStyle(
                        fontSize: 16, // Adjusted to match logo size better
                        color: Colors.white70, // Lighter text color
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Circular progress indicator with red color
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Align the row in the center
                children: [
                  Text(
                    'Made with ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // Matching app theme color
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red, // Heart icon in red
                    size: 16,
                  ),
                  SizedBox(width: 4), // Small space between heart and username
                  Text(
                    '@rahulthewhitehat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red, // Matching app theme color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
