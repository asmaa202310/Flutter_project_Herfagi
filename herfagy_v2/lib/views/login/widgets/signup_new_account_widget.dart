import 'package:flutter/material.dart';

class SignUpNewAccountWidget extends StatelessWidget {
  const SignUpNewAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ليس لديك حساب؟", style: TextStyle(fontSize: screenWidth * 0.04)),
        GestureDetector(
          onTap: () {},
          child: Text(
            "  عمل حساب",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.042,
            ),
          ),
        ),
      ],
    );
  }
}
