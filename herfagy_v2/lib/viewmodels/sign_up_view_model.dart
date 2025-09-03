import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  bool obscurePassword = true;
  bool loading = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
