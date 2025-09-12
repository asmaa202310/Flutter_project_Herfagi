import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double width({double fraction = 1}) => screenWidth * fraction;
  static double height({double fraction = 1}) => screenHeight * fraction;
  static double text({double fraction = 1}) => screenWidth * fraction;
}
