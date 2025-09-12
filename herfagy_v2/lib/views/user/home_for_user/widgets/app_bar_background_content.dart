import 'package:flutter/material.dart';
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: const ProfileListTileWidget(),
    );
  }
}
