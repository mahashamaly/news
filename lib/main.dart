import 'package:flutter/material.dart';
import 'package:news/features/auth/login-screen.dart';
import 'package:news/features/auth/register-screen.dart';
import 'package:news/features/core/datasource/local-data/Preferences_manager.dart';
import 'package:news/features/core/theme/light_theme.dart';
import 'package:news/features/home/home-screen.dart';
import 'package:news/features/main/main-screen.dart';
import 'package:news/features/onboarding/onboarding-screen.dart';
import 'package:news/features/splash/splash-screen.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
   await PreferencesManager().init();
   //PreferencesManager().clear();
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
      home:Splashscreen()
    );
  }
}

