import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool obscurePassword = true;
  bool loading = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
