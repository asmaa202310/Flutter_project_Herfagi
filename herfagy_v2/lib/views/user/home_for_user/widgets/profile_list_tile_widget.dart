import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../utils/size_config.dart';

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    final profileOperationViewModel = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    return FutureBuilder(
      future: profileOperationViewModel.getCurrentUserProfile(),
      builder: (context, snapshot) {
        String userName = '';

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          userName = snapshot.data?.username ?? '';
        }

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
            localization.greetingMessage(
              userName.isNotEmpty ? userName : '...',
            ),
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
        );
      },
    );
  }
}
