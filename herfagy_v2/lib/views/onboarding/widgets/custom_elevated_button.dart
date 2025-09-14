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
    this.width,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
  });
  final VoidCallback onTap;
  final String text;
  final double fontSize;
  final double? height;
  final double? width;
  final double? borderRaduis;
  final double? padding;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: padding == null ? null : EdgeInsets.all(padding!),
        backgroundColor: backgroundColor ?? Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 12),
        ),
        minimumSize: Size(width ?? SizeConfig.screenWidth, height ?? 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
