import 'package:flutter/material.dart';
import 'package:food_hub/view/login_page.dart';
import 'package:food_hub/view/onboarding_page.dart';
import 'package:food_hub/view/signup_page.dart';
import 'package:food_hub/view/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set SplashScreen as the initial route
      routes: {
        '/': (context) =>
            const SplashScreen(), // SplashScreen is the first screen
        '/onboarding': (context) => const OnboardingPage(),
        '/signup': (context) => const SignUpPage(), // Onboarding screen
        '/login': (context) => const LoginPage()
      },
    );
  }
}
