import 'package:flutter/material.dart';

class RowCheckAccountWidget extends StatelessWidget {
  const RowCheckAccountWidget({
    super.key,
    required this.questionText,
    required this.buttonText,
    required this.onTap,
  });
  final String questionText;
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: TextStyle(fontSize: screenWidth * 0.04)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
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
