import 'package:flutter/material.dart';

import '../../home/home_for_user/home_user_view.dart';

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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeUserView()),
        );
      },
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
