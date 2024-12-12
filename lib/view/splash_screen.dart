import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background color
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.width *
              3.0, // Larger height dynamically scaled
          width: MediaQuery.of(context).size.width *
              3.0, // Larger width dynamically scaled
          child: Image.asset(
            'assets/images/logo.png', // Path to the logo
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
