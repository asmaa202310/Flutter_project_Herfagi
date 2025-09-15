import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '/utils/size_config.dart';
import 'app_bar_background_content.dart';
import 'custom_search_bar.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({super.key, required this.searchHintText});
  final String searchHintText;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.kAppBarHome1Light
          : AppColors.kAppBarHome1Dark,
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.height(fraction: 0.11)),
        child: CustomSearchBar(hintText: searchHintText),
      ),
    );
  }
}
