import 'package:flutter/material.dart';
import '../../../viewmodels/home_user_view_model.dart';
import 'category_items_list_view_builder.dart';
import 'custom_sliver_app_bar.dart';
import 'section_header.dart';
import 'service_sliver_list_builder.dart';
import 'top_crafters_list_view_builder.dart';

class HomeUserViewBody extends StatelessWidget {
  const HomeUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
        SliverToBoxAdapter(
          child: SectionHeader(screenWidth: screenWidth, title: "الفئات"),
        ),
        SliverToBoxAdapter(
          child: CategoryItemsListViewBuilder(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            categories: HomeUserViewModel.categories,
          ),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(
            screenWidth: screenWidth,
            title: "الأعلى تقييماً",
          ),
        ),
        SliverToBoxAdapter(
          child: TopCraftersListViewBuilder(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            crafters: HomeUserViewModel.topCrafters,
          ),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(
            screenWidth: screenWidth,
            title: "الخدمات الشائعة",
          ),
        ),
        ServiceSliverListBuilder(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ],
    );
  }
}
