import 'package:flutter/material.dart';
import '../../../../viewmodels/home_user_view_model.dart';
import 'category_items_list_view_builder.dart';
import 'custom_sliver_app_bar.dart';
import 'section_header.dart';
import 'service_sliver_list_builder.dart';
import 'top_crafters_list_view_builder.dart';

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSilverAppBar(),
        const SliverToBoxAdapter(child: SectionHeader(title: "الفئات")),
        SliverToBoxAdapter(
          child: CategoryItemsListViewBuilder(
            categories: HomeUserViewModel.categories,
          ),
        ),
        const SliverToBoxAdapter(child: SectionHeader(title: "الأعلى تقييماً")),
        SliverToBoxAdapter(
          child: TopCraftersListViewBuilder(
            crafters: HomeUserViewModel.topCrafters,
          ),
        ),
        const SliverToBoxAdapter(
          child: SectionHeader(title: "الخدمات الشائعة"),
        ),
        const ServiceSliverListBuilder(),
      ],
    );
  }
}
