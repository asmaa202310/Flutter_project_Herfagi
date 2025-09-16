import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/rating_operation_view_model.dart';
import 'package:herfagy_v2/views/category_details/widgets/custom_crafter_card.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'package:provider/provider.dart';

class CategoryDetailsViewBody extends StatefulWidget {
  const CategoryDetailsViewBody({super.key, required this.category});
  final Service category;

  @override
  State<CategoryDetailsViewBody> createState() =>
      _CategoryDetailsViewBodyState();
}

class _CategoryDetailsViewBodyState extends State<CategoryDetailsViewBody> {
  List<Profile> profilesCrafters = [];
  List<Profile> profilesUsers = [];

  void _matchProfilesWithServices(List<Profile> profiles) {
    profilesCrafters.clear();
    profilesUsers.clear();

    for (var profile in profiles) {
      if (profile.serviceId == null) {
        profilesUsers.add(profile);
      } else {
        if (profile.serviceId == widget.category.id) {
          profilesCrafters.add(profile);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<ProfileOperationViewModel>(context, listen: false).profiles;
    final ratingVM =  Provider.of<RatingOperationViewModel>(context, listen: false);

    _matchProfilesWithServices(profiles);

    return CustomScrollView(
      slivers: [
        CustomGeneralSliverAppBar(
          text: widget.category.name,
          automaticallyImplyLeading: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(SizeConfig.width(fraction: 0.03)),
          sliver: SliverList.builder(
            itemCount: profilesCrafters.length,
            itemBuilder: (context, index) {
              final crafter = profilesCrafters[index];

              return FutureBuilder<int?>(
                future: ratingVM.getHighestRatingByCrafter(crafter.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      padding: EdgeInsets.all(SizeConfig.width(fraction: 0.04)),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  final rate = snapshot.data;
                  return CustomCrafterCard(
                    category: widget.category,
                    crafter: crafter,
                    rate: rate,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
