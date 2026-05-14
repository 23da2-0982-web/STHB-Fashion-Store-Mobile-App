import 'package:flutter/material.dart';

class CreateAccountViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  bool _agreedToTerms = false;
  bool get agreedToTerms => _agreedToTerms;

  set agreedToTerms(bool value) {
    _agreedToTerms = value;
    notifyListeners();
  }

  void createAccount() {
    // Add logic here to validate and perform account creation
    if (_agreedToTerms) {
      // Validate inputs
    }
  }

  void loginWithGoogle() {
    // Add Google sign-in logic here
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
