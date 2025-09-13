import 'package:flutter/material.dart';

class CustomDetailsButton extends StatelessWidget {
  const CustomDetailsButton({
    super.key,
    required this.borderRaduis,
    required this.text,
    required this.fontSize,
    required this.onTap,
    this.color,
  });
  final double borderRaduis;
  final String text;
  final Color? color;
  final double fontSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
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
