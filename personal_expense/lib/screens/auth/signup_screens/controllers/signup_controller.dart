import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  void createSignup(String name, String email, String password) {
    Column(
      children: [
        Text(name),
        Text(email),
        Text(password),
      ],
    );
  }
}
