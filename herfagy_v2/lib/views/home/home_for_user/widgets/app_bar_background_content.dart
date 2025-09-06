import 'package:flutter/material.dart';
import 'profile_list_tile_widget.dart';

class AppBarBackgroundContent extends StatelessWidget {
  const AppBarBackgroundContent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(
        left: screenWidth * 0.05,
        top: screenHeight * 0.07,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.02,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: ProfileListTileWidget(),
    );
  }
}
