import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    this.height,
    this.borderRaduis,
    this.padding,
  });
  final VoidCallback onTap;
  final String text;
  final double fontSize;
  final double? height;
  final double? borderRaduis;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: padding == null ? null : EdgeInsets.all(padding!),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 12),
        ),
        minimumSize: Size(SizeConfig.screenWidth, height ?? 50),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}
