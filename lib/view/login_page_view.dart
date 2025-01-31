// import 'package:flutter/material.dart';

// import 'dashboard_page_view.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();

//     void handleLogin() {
//       String email = emailController.text;
//       String password = passwordController.text;

//       if (email == 'admin' && password == 'admin') {
//         // Show success Snackbar
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Login successful!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         // Navigate to the Dashboard
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const DashboardPageView()),
//         );
//       } else {
//         // Show error Snackbar
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Invalid email or password!'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }

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
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Email Field
//                       TextField(
//                         controller: emailController,
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
//                         controller: passwordController,
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
//                       // Login Button
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 50, vertical: 15),
//                         ),
//                         onPressed: handleLogin,
//                         child: const Text(
//                           'LOGIN',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       // Sign Up Link
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/signup');
//                         },
//                         child: const Text(
//                           'Don’t have an account? Sign Up',
//                           style: TextStyle(color: Colors.orange),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       // Social Media Login
//                       const Text(
//                         'Login with',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           GestureDetector(
//                             onTap: () {},
//                             child: const CircleAvatar(
//                               radius: 25,
//                               backgroundImage:
//                                   AssetImage('assets/images/facebook.png'),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {},
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
