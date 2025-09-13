import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/utils/localization_extension.dart';
import '../../../../utils/show_logout_dialogue.dart';
import '../../../../utils/size_config.dart';
import '../../../../viewmodels/profile_crafter_view_model.dart';
import '../../../user/orders_for_user/widgets/custom_general_app_bar.dart';
import '../../../user/profile_for_user/widgets/menu_section.dart';
import '../../../user/profile_for_user/widgets/profile_header.dart';
import '../../../user/profile_for_user/widgets/settings_section.dart';
import 'crafter_gallery_section.dart';

class CrafterProfileViewBody extends StatelessWidget {
  const CrafterProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);
    return CustomScrollView(
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
              MenuSection(items: ProfileCrafterViewModel.menuItems(context)),
              const SizedBox(height: 30),
              const CrafterGallerySection(),
              const SizedBox(height: 30),
              SettingsSection(
                darkModeEnabled: true,
                onNotificationsChanged: (_) {},
                onDarkModeChanged: (value) {},
                onLogout: () => showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
