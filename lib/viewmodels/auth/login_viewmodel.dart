import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    // Add logic here to validate and perform login
  }

  void loginWithGoogle() {
    // Add Google sign-in logic here
  }

  void forgotPassword() {
    // Add forgot password navigation or API logic here
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
