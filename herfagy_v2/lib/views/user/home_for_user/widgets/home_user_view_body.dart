import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'category_items_list_view_builder.dart';
import 'custom_sliver_app_bar.dart';
import 'section_header.dart';
import 'service_sliver_list_builder.dart';
import 'top_crafters_list_view_builder.dart';

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

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
        const SliverToBoxAdapter(child: CategoryItemsListViewBuilder()),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.sectionTopRated),
        ),
        const SliverToBoxAdapter(child: TopCraftersListViewBuilder()),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.sectionPopularServices),
        ),
        const ServiceSliverListBuilder(),
      ],
    );
  }
}
