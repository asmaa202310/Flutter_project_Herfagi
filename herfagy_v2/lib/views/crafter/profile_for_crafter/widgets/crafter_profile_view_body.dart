import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
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
import '../../../../models/profile.dart';

class CrafterProfileViewBody extends StatelessWidget {
  const CrafterProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    SizeConfig.init(context);

    final profileCrafterViewModel = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    return FutureBuilder<Profile?>(
      future: profileCrafterViewModel.getCurrentUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text("No crafter profile found"));
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
                    location: profile.location ?? "UnKnown",
                    screenWidth: SizeConfig.screenWidth,
                  ),
                  MenuSection(
                    items: ProfileCrafterViewModel.menuItems(context),
                  ),
                  const SizedBox(height: 30),
                  const CrafterGallerySection(),
                  const SizedBox(height: 30),
                  SettingsSection(onLogout: () => showLogoutDialog(context)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
