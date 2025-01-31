import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/app/di/di.dart';
import 'package:food_hub/core/app_theme/app_theme.dart';
import 'package:food_hub/features/splash/presentation/view/splash_screen_view.dart';
import 'package:food_hub/features/splash/presentation/view_model/cubit/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      theme: AppTheme.getApplicationTheme(isDark: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashScreen(),
      ),
    );
  }
}
