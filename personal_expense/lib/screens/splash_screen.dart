import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signin_screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.to(
          () => const SignInScreen(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Personal Expense',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green.withOpacity(0.5)),
        ),
      ),
    );
  }
}
