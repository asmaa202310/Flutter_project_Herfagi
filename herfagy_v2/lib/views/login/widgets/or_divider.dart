import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
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
          context.localization.orSignInWith,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: screenWidth * 0.045),
        ),
        Expanded(child: CustomDivider(screenWidth: screenWidth)),
      ],
    );
  }
}
