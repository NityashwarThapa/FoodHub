// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_hub/features/auth/presentation/view/signup_page_view.dart';
// import 'package:food_hub/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import 'package:food_hub/features/home/presentation/home_view.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void handleLogin() async {
//     var userBox = await Hive.openBox('users'); // Open Hive database
//     String email = emailController.text;
//     String password = passwordController.text;

//     if (userBox.containsKey(email)) {
//       Map<String, dynamic> userData = userBox.get(email);
//       if (userData["password"] == password) {
//         _showSnackBar("Login successful!", Colors.green);

//         // Navigate to Dashboard after a short delay
//         Future.delayed(const Duration(seconds: 1), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const DashboardPageView()),
//           );
//         });
//       } else {
//         _showSnackBar("Incorrect password. Try again.", Colors.red);
//       }
//     } else {
//       _showSnackBar("No account found with this email.", Colors.red);
//     }
//   }

//   void _showSnackBar(String message, Color backgroundColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: backgroundColor,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

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
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Email Field
//                       TextField(
//                           key: const Key('email'),
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: 'E-mail',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           )
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             final emailRegex =
//                                 RegExp(r"^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
//                             if (!emailRegex.hasMatch(value)) {
//                               return "Enter a valid email address";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(height: 15),
//                       // Password Field
//                       TextField(
//                         key: const Key('email'),
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           suffixIcon: const Icon(Icons.visibility),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {}, // Implement forgot password logic
//                           child: const Text(
//                             'Forget Password?',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
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
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text("Don’t have an account?"),
//                           TextButton(
//                             onPressed: () {
//                               context.read<LoginBloc>().add(
//                                     NavigateRegisterScreenEvent(
//                                       context: context,
//                                       destination: const SignUpPage(),
//                                     ),
//                                   );
//                             },
//                             child: const Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Color(0xFF3579FF),
//                               ),
//                             ),
//                           ),
//                         ],
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

// import 'package:flutter/material.dart';
// import 'package:food_hub/features/auth/presentation/view/signup_page_view.dart';
// import 'package:food_hub/features/home/presentation/home_view.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void handleLogin() async {
//     var userBox = await Hive.openBox('users'); // Open Hive database
//     String email = emailController.text;
//     String password = passwordController.text;

//     if (userBox.containsKey(email)) {
//       Map<String, dynamic> userData = userBox.get(email);
//       if (userData["password"] == password) {
//         _showSnackBar("Login successful!", Colors.green);

//         Future.delayed(const Duration(seconds: 1), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const DashboardPageView()),
//           );
//         });
//       } else {
//         _showSnackBar("Incorrect password. Try again.", Colors.red);
//       }
//     } else {
//       _showSnackBar("No account found with this email.", Colors.red);
//     }
//   }

//   void _showSnackBar(String message, Color backgroundColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: backgroundColor,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

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
//                       const Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextField(
//                           key: const Key('email'),
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: 'E-mail',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             final emailRegex =
//                                 RegExp(r"^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
//                             if (!emailRegex.hasMatch(value)) {
//                               return "Enter a valid email address";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(height: 15),
//                       TextField(
//                         key: const Key('password'),
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           suffixIcon: const Icon(Icons.visibility),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Forget Password?',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
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
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text("Don’t have an account?"),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const SignUpPage()),
//                               );
//                             },
//                             child: const Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Color(0xFF3579FF),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
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

import 'package:flutter/material.dart';
import 'package:food_hub/features/home/presentation/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      var userBox = await Hive.openBox('users'); // Open Hive database
      String email = emailController.text;
      String password = passwordController.text;

      if (userBox.containsKey(email)) {
        Map<String, dynamic> userData = userBox.get(email);
        if (userData["password"] == password) {
          _showSnackBar("Login successful!", Colors.green);

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardPageView()),
            );
          });
        } else {
          _showSnackBar("Incorrect password. Try again.", Colors.red);
        }
      } else {
        _showSnackBar("No account found with this email.", Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  left: -50,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.orange.shade100,
                  ),
                ),
                Positioned(
                  top: -50,
                  right: -50,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.orange.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 150),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: const Key('email'),
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                final emailRegex = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
                                if (!emailRegex.hasMatch(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              key: const Key('password'),
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: const Icon(Icons.visibility),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        onPressed: handleLogin,
                        child: const Text(
                          key: ValueKey('loginButton'),
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Login with',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/facebook.png'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/google.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
