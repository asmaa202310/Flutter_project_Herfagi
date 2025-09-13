import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/crafter/home_for_crafter/widgets/custom_icon_button.dart';
import '../../../../utils/size_config.dart';

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);
    return ListTile(
      leading: CircleAvatar(
        radius: SizeConfig.width(fraction: 0.067),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Colors.blue,
          size: SizeConfig.width(fraction: 0.07),
        ),
      ),
      title: Text(
        localization.greetingMessage('عبدالعزيز'),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.width(fraction: 0.045),
        ),
      ),
      subtitle: Text(
        localization.helpMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.width(fraction: 0.035),
        ),
      ),
      trailing: Stack(
        children: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.notifications,
            color: Colors.white,
            iconSize: SizeConfig.width(fraction: 0.1),
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.009,
            right: SizeConfig.screenWidth * 0.01,
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              radius: SizeConfig.screenWidth * 0.029,
              child: Text('1', style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
