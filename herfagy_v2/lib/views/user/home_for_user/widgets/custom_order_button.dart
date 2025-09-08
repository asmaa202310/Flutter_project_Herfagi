import 'package:flutter/material.dart';

class CustomUserButton extends StatelessWidget {
  const CustomUserButton({
    super.key,
    required this.borderRaduis,
    required this.text,
    required this.fontSize,
    this.color,
  });
  final double borderRaduis;
  final String text;
  final Color? color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
