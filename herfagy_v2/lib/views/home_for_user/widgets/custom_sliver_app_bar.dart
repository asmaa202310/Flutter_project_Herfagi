import 'package:flutter/material.dart';
import 'app_bar_background_content.dart';
import 'custom_search_bar.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      pinned: true,
      // floating: true,
      expandedHeight: screenHeight * 0.18,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: AppBarBackgroundContent(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.09),
        child: CustomSearchBar(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ),
    );
  }
}
