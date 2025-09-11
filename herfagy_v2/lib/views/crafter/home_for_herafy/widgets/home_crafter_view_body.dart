import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import '../../../user/home_for_user/widgets/custom_sliver_app_bar.dart';
import '../../../user/home_for_user/widgets/section_header.dart';
import 'crafter_services_builder.dart';
import 'custom_progress_indicator.dart';
import 'new_requests_list.dart';

class HomeCrafterViewBody extends StatelessWidget {
  const HomeCrafterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
        SliverToBoxAdapter(
          child: CustomProgressIndicator(screenWidth: screenWidth),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(
            screenWidth: screenWidth,
            title: context.localization.myServices,
          ),
        ),
        SliverToBoxAdapter(
          child: CrafterServicesBuilder(screenWidth: screenWidth),
        ),
        SliverToBoxAdapter(
          child: SectionHeader(
            screenWidth: screenWidth,
            title: context.localization.newRequests,
          ),
        ),
        const NewRequestsList(),
      ],
    );
  }
}
