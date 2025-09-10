import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    // required this.index,
    required this.onTap,
    required this.icon,
    required this.color,
  });
  // final int index;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: onTap,
    );
  }
}
