import 'package:flutter/material.dart';

class RejectAcceptButton extends StatelessWidget {
  const RejectAcceptButton({
    super.key,
    required this.index,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.buttonColor,
  });

  final int index;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
    );
  }
}
