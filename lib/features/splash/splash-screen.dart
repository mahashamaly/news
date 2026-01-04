import 'package:flutter/material.dart';
import 'package:news/features/core/datasource/local-data/Preferences_manager.dart';
import 'package:news/features/home/home-screen.dart';
import 'package:news/features/auth/login-screen.dart';
import 'package:news/features/main/main-screen.dart';
import 'package:news/features/onboarding/model/onboarding-model.dart';
import 'package:news/features/onboarding/onboarding-screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    _navigateAfterSplash();
    super.initState();
  }

  void _navigateAfterSplash() async{
    await Future.delayed(Duration(seconds: 1));
    //لو القيمة موجودة راح يخزنها ب الاون بوردينج اذا لا نل بستخدم القيمة الافتراضية فولس
    final bool onboardingcomplete =
        PreferencesManager().getBool('onboarding-complete') ?? false;
    final bool isLoggedIn =
        PreferencesManager().getBool('is-logged-in') ?? false;

        if(!mounted)return;
    //هنا المستخدم اذا ما شاهد واجهات الاون بوردنج
    if (!onboardingcomplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
      //هنا لو مش عامل تسجيل دخول
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      //هنا لو شاف الواجهات وعمل تسجيل دخول خلص بحوله للهوم
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mainscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/img/splash.png',
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
