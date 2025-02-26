import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/features/auth/presentation/view/signup_page_view.dart';
import 'package:food_hub/features/auth/presentation/view_model/login/bloc/login_bloc.dart';

import '../../../../app/di/di.dart';
import '../../../home/presentation/home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _loginUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginStudentEvent(
            email: emailController.text,
            password: passwordController.text,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: Builder(builder: (context) {
          return BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPageView()),
                  );
                }
              },
              child: Scaffold(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
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
                                          final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
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
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                  ),
                                  onPressed: () => _loginUser(context),
                                  child: const Text(
                                    key: ValueKey('loginButton'),
                                    'LOGIN',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have an account?"),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                                        );
                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.black),
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
              ));
        }));
  }
}
