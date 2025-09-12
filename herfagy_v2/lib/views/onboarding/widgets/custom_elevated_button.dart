import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
  });
  final VoidCallback onTap;
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(SizeConfig.screenWidth, 50),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}
