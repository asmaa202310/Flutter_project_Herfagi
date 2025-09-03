import 'package:flutter/material.dart';
import '/views/login/widgets/custom_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(child: CustomDivider(screenWidth: screenWidth)),
        Text(
          "أو سجل من خلال",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            // fontWeight: FontWeight.w500,
            color: Colors.blueGrey,
          ),
        ),
        Expanded(child: CustomDivider(screenWidth: screenWidth)),
      ],
    );
  }
}
