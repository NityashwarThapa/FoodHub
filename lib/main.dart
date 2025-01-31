import 'package:flutter/material.dart';
import 'package:food_hub/app/app.dart';
import 'package:food_hub/app/di/di.dart';
import 'package:food_hub/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Delete all the hive data and boxes
  // await HiveService().clearAll();
  // Initialize Dependencies
  await initDependencies();

  runApp(
    const App(),
  );
}
