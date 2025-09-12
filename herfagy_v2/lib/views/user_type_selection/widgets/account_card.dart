import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';

class AccountCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;
  final VoidCallback onTap;

  const AccountCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.borderColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.height(fraction: 0.025),
          horizontal: SizeConfig.width(fraction: 0.05),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: borderColor.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            width: SizeConfig.width(fraction: 0.15),
            height: SizeConfig.width(fraction: 0.15),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: SizeConfig.width(fraction: 0.08),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: iconColor,
              fontSize: SizeConfig.width(fraction: 0.045),
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              color: iconColor,
              fontSize: SizeConfig.width(fraction: 0.035),
              height: 1.3,
            ),
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
