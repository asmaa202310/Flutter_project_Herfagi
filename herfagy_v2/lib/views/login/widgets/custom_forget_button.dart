import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import '/views/forget_password/forget_password_view.dart';

class CustomForgetPasswordButton extends StatelessWidget {
  const CustomForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPasswordView()),
            );
          },
          child: Text(
            context.localization.forgotPassword,
            style: TextStyle(
              color: Colors.blue,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
