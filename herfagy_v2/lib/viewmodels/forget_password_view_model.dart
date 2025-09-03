import 'package:flutter/material.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  bool loading = false;

  Future<void> sendResetLink(String email) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }
}
