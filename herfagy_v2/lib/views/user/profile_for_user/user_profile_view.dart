import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../models/profile.dart';
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

    final profileOperationViewModel = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    return Scaffold(
      body: FutureBuilder<Profile?>(
        future: profileOperationViewModel.getCurrentUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No profile found"));
          }

          final profile = snapshot.data!;

          return CustomScrollView(
            slivers: [
              CustomGeneralSliverAppBar(text: localization.myAccount),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList.list(
                  children: [
                    ProfileHeader(
                      userName: profile.username,
                      location: profile.location ?? "",
                      screenWidth: SizeConfig.screenWidth,
                    ),
                    MenuSection(items: ProfileUserViewModel.menuItems(context)),
                    const SizedBox(height: 30),
                    SettingsSection(onLogout: () => showLogoutDialog(context)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
