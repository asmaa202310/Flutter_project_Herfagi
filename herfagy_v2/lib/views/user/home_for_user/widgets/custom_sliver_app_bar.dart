import 'package:flutter/material.dart';
import '/utils/size_config.dart';
import 'app_bar_background_content.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SliverAppBar(
      backgroundColor: Colors.blue,
      pinned: true,
      floating: true,
      expandedHeight: SizeConfig.height(fraction: 0.18),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: const AppBarBackgroundContent(),
      ),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(screenHeight * 0.09),
      //   child: CustomSearchBar(
      //     screenWidth: screenWidth,
      //     screenHeight: screenHeight,
      //   ),
      // ),
    );
  }
}
