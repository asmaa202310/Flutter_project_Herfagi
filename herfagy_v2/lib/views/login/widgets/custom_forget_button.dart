import 'package:flutter/material.dart';

class CustomForgetPasswordButton extends StatelessWidget {
  const CustomForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "نسيت حسابك؟",
            style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.045),
          ),
        ),
      ],
    );
  }
}
