import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signup_screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: _emailController,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.withOpacity(0.5)))),
        ],
      ),
    );
  }
}
