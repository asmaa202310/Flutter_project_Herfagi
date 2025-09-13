import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_orders_app_bar.dart';

import '../../../utils/show_logout_dialogue.dart';
import '../../../viewmodels/profile_user_view_model.dart';
import 'widgets/menu_section.dart';
import 'widgets/profile_header.dart';
import 'widgets/settings_section.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  final bool darkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomGeneralSliverAppBar(text: localization.myAccount),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.list(
              children: [
                ProfileHeader(
                  userName: 'محمد علي',
                  location: 'القاهرة، مصر',
                  screenWidth: SizeConfig.screenWidth,
                ),
                MenuSection(items: ProfileUserViewModel.menuItems(context)),
                const SizedBox(height: 30),
                SettingsSection(
                  darkModeEnabled: darkModeEnabled,
                  onNotificationsChanged: (_) {},
                  onDarkModeChanged: (_) {},
                  onLogout: () => showLogoutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
