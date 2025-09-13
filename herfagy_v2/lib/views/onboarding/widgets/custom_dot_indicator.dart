import 'package:flutter/material.dart';
import '/utils/size_config.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(fraction: 0.012),
      ),
      width: isActive
          ? SizeConfig.width(fraction: 0.08)
          : SizeConfig.width(fraction: 0.035),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
