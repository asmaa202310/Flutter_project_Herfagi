import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../utils/size_config.dart';
import 'profile_list_tile_widget.dart';

class AppBarBackgroundContent extends StatelessWidget {
  const AppBarBackgroundContent({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsetsGeometry.only(
        left: SizeConfig.width(fraction: 0.05),
        top: SizeConfig.height(fraction: 0.07),
        right: SizeConfig.width(fraction: 0.05),
        bottom: SizeConfig.height(fraction: 0.02),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Theme.of(context).brightness == Brightness.light
              ? [AppColors.kAppBarHome1Light, AppColors.kAppBarHome2Light]
              : [AppColors.kAppBarHome1Dark, AppColors.kAppBarHome2Dark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: const ProfileListTileWidget(),
    );
  }
}
