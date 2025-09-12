import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
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
        child: Icon(Icons.person, color: Colors.blue),
      ),
      title: Text(
        localization.greetingMessage('عبدالعزيز'),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.screenWidth > 600 ? 26 : 18,
        ),
      ),
      subtitle: Text(
        localization.helpMessage,
        style: TextStyle(
          color: Colors.white70,
          fontSize: SizeConfig.screenWidth > 600 ? 17 : 13,
        ),
      ),
      trailing: Stack(
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              Icons.notifications_none,
              size: SizeConfig.screenWidth > 600
                  ? SizeConfig.width(fraction: 0.1)
                  : SizeConfig.width(fraction: 0.09),
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.01,
            right: SizeConfig.screenWidth * 0.015,
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              radius: SizeConfig.screenWidth > 600
                  ? SizeConfig.screenWidth * 0.05
                  : SizeConfig.screenWidth * 0.029,
              child: Text('1', style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
