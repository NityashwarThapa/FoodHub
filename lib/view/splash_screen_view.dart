// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Navigate to the OnboardingPage after 3 seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/onboarding');
//     });

//     return Scaffold(
//       backgroundColor: Colors.white, // White background color
//       body: Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.width *
//               3.0, // Larger height dynamically scaled
//           width: MediaQuery.of(context).size.width *
//               4.0, // Larger width dynamically scaled
//           child: Image.asset(
//             'assets/images/logo.png', // Path to the logo
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   // }
// }
