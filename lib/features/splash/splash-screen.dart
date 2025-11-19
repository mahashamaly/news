import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: Image.asset(
        'assets/img/splash.png',
        width: double.infinity,
        fit: BoxFit.fill,),
    );
  }
}