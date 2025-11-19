import 'package:flutter/material.dart';
import 'package:news/features/core/theme/light_theme.dart';
import 'package:news/features/home/home-screen.dart';
import 'package:news/features/onboarding/onboarding-screen.dart';
import 'package:news/features/splash/splash-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: Homescreen()
    );
  }
}

