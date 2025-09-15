import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import '../../../user/home_for_user/widgets/custom_sliver_app_bar.dart';
import '../../../user/home_for_user/widgets/section_header.dart';
import 'custom_progress_indicator.dart';
import 'new_requests_list.dart';

class HomeCrafterViewBody extends StatelessWidget {
  const HomeCrafterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return CustomScrollView(
      slivers: [
        CustomSilverAppBar(
          searchHintText: localization.searchForCustomerPlaceholder,
        ),
        const SliverToBoxAdapter(child: CustomProgressIndicator()),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.myServices),
        ),
        // const SliverToBoxAdapter(child: CrafterServicesBuilder()),
        SliverToBoxAdapter(
          child: SectionHeader(title: localization.newRequests),
        ),
        const NewRequestsList(),
      ],
    );
  }
}
