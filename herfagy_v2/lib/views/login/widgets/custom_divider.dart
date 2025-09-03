import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade400,
      indent: screenWidth * 0.04,
      thickness: 1,
      endIndent: screenWidth * 0.04,
    );
  }
}
