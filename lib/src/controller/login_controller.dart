import 'package:first_first_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool passwordToggle = false.obs;

  final emailController = TextEditingController().obs;
  final passWordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final formField = GlobalKey<FormState>();

  void togglePassword() {
    passwordToggle.value = !passwordToggle.value;
  }

  String? validateEmail(String? email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }

    if (password.length < 6) {
      return 'Password length should be greater than 6';
    }

    return null;
  }
}
