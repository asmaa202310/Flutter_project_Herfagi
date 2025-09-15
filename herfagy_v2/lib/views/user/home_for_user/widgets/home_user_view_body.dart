import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/rating_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'category_items_list_view_builder.dart';
import 'custom_sliver_app_bar.dart';
import 'section_header.dart';
import 'service_sliver_list_builder.dart';
import 'top_crafters_list_view_builder.dart';

class HomeUserViewBody extends StatefulWidget {
  const HomeUserViewBody({super.key});

  @override
  State<HomeUserViewBody> createState() => _HomeUserViewBodyState();
}

class _HomeUserViewBodyState extends State<HomeUserViewBody> {
  List<Profile> profilesCrafters = [];
  List<int?> rating = [];

  Future<void> _matchProfilesWithServices(
    List<Profile> profiles,
    List<Service> services,
    RatingOperationViewModel rateMv,
  ) async {
    profilesCrafters.clear();
    rating.clear();

    for (var profile in profiles) {
      for (var service in services) {
        if (profile.serviceId == service.id) {
          profilesCrafters.add(profile);
          rating.add(await rateMv.getHighestRatingByCrafter(profile.id));
          break;
        }
      }
    }

    final combined = List.generate(
      profilesCrafters.length,
      (i) => {'profile': profilesCrafters[i], 'rate': rating[i]},
    );

    combined.sort((a, b) {
      final int rateA = (a['rate'] ?? 0) as int;
      final int rateB = (b['rate'] ?? 0) as int;
      return rateB.compareTo(rateA);
    });

    profilesCrafters = combined.map((e) => e['profile'] as Profile).toList();
    rating = combined.map((e) => e['rate'] as int?).toList();

    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profiles = context.watch<ProfileOperationViewModel>().profiles;
    final services = context.watch<ServiceOperationViewModel>().services;
    final rateMv = context.watch<RatingOperationViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _matchProfilesWithServices(profiles, services, rateMv);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          searchHintText: localization.searchForCrafterPlaceholder,
        ),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.sectionCategories),
        ),
        SliverToBoxAdapter(
          child: CategoryItemsListViewBuilder(
            services: context.watch<ServiceOperationViewModel>().services,
          ),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.sectionTopRated),
        ),
        SliverToBoxAdapter(
          child: TopCraftersListViewBuilder(
            profilesCrafters: profilesCrafters,
            rating: rating,
          ),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.sectionPopularServices),
        ),
        ServiceSliverListBuilder(
          services: context.watch<ServiceOperationViewModel>().services,
        ),
      ],
    );
  }
}
