import 'package:flutter/material.dart';
import 'package:food_hub/view/dashboard_page.dart';
import 'package:food_hub/view/onboarding_page.dart';
import 'package:food_hub/view/signup_page.dart';
import 'package:food_hub/view/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
