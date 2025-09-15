import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/reviews/reviews_view.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'package:herfagy_v2/views/user/profile_for_user/widgets/menu_item.dart';
import '../../../utils/size_config.dart';
import '../../crafter/profile_for_crafter/widgets/crafter_gallery_section.dart';
import '../../user/profile_for_user/widgets/profile_header.dart';

class ProfileOverviewViewBody extends StatelessWidget {
  const ProfileOverviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomGeneralSliverAppBar(text: context.localization.overview),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.height(fraction: 0.02)),
              ProfileHeader(
                userName: 'name ',
                location: 'location',
                screenWidth: MediaQuery.widthOf(context),
              ),

              const SizedBox(height: 20),
              const SizedBox(height: 10),
              const CrafterGallerySection(),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.reviews,
                title: context.localization.reviews,
                color: Colors.grey,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CrafterReviewsView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
