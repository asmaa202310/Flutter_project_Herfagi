import 'package:flutter/material.dart';

class CustomLoginSignUpButton extends StatelessWidget {
  const CustomLoginSignUpButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
  });
  final String text;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(screenWidth, screenHeight * 0.06),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
      ),
    );
  }
}
