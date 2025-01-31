// import 'package:flutter/material.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: IntrinsicHeight(
//             child: Stack(
//               children: [
//                 // Background Decorations
//                 Positioned(
//                   top: -100,
//                   left: -50,
//                   child: CircleAvatar(
//                     radius: 100,
//                     backgroundColor: Colors.orange.shade100,
//                   ),
//                 ),
//                 Positioned(
//                   top: -50,
//                   right: -50,
//                   child: CircleAvatar(
//                     radius: 70,
//                     backgroundColor: Colors.orange.shade300,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0, vertical: 60.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 150),
//                       // Title
//                       const Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Full Name Field
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Full name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(color: Colors.orange),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       // Email Field
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'E-mail',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(color: Colors.orange),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       // Password Field
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           suffixIcon: const Icon(Icons.visibility),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: const BorderSide(color: Colors.orange),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       // Sign Up Button
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 50, vertical: 15),
//                         ),
//                         onPressed: () {
//                           // Add Sign Up functionality here
//                         },
//                         child: const Text(
//                           'SIGN UP',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       // Login Link
//                       TextButton(
//                         onPressed: () {
//                           // Navigate to the Login Page
//                           Navigator.pushNamed(context, '/login');
//                         },
//                         child: const Text(
//                           'Already have an account? Login',
//                           style: TextStyle(color: Colors.orange),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       // Social Media Login
//                       const Text(
//                         'Sign up with',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               // Handle Facebook Sign Up
//                             },
//                             child: const CircleAvatar(
//                               radius: 25,
//                               backgroundImage:
//                                   AssetImage('assets/images/facebook.png'),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Handle Google Sign Up
//                             },
//                             child: const CircleAvatar(
//                               radius: 25,
//                               backgroundImage:
//                                   AssetImage('assets/images/google.png'),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
