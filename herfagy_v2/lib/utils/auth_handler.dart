import 'package:flutter/material.dart';

class AuthHandler {
  static Future<void> handleAuth({
    required BuildContext context,
    required Future<String?> Function() action,
    required Widget Function() onSuccessScreen,
  }) async {
    final error = await action();

    if (!context.mounted) return;

    if (error == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => onSuccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      debugPrint(error);
    }
  }
}
