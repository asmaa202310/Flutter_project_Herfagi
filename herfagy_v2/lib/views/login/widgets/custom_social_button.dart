import 'package:flutter/material.dart';

class CustomSocailButton extends StatelessWidget {
  const CustomSocailButton({
    super.key,
    required this.raduis,
    required this.logo,
    required this.onTap,
  });
  final double raduis;
  final String logo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(raduis),
      onTap: onTap,
      child: CircleAvatar(
        radius: raduis,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(logo),
      ),
    );
  }
}
