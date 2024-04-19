import 'package:flutter/material.dart';
import 'package:instacare/screens/home_screen.dart';
import 'package:instacare/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaCare',
      theme: const AppTheme().themeData,
      home: const HomeScreen(),
    );
  }
}
