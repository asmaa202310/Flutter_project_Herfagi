import 'package:flutter/material.dart';
import '/utils/size_config.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.width(fraction: 0.05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.width(fraction: 0.055),
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
