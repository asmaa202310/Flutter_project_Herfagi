import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/viewmodels/home_crafter_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/views/crafter/home_for_crafter/widgets/crafter_services_builder.dart';
import 'package:provider/provider.dart';
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

    final ordersVM = Provider.of<OrderOperationViewModel>(context);
    final progressVM = Provider.of<ProgressProvider>(context, listen: false);
    final profileVM = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    return FutureBuilder<Profile?>(
      future: profileVM.getCurrentUserProfile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = snapshot.data!;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          progressVM.updateOrders(ordersVM.orders, profile.id);
        });

        return CustomScrollView(
          slivers: [
            CustomSilverAppBar(
              searchHintText: localization.searchForCustomerPlaceholder,
            ),
            const SliverToBoxAdapter(child: CustomProgressIndicator()),
            SliverToBoxAdapter(
              child: SectionHeader(title: localization.myServices),
            ),
            const SliverToBoxAdapter(child: CrafterServicesBuilder()),
            SliverToBoxAdapter(
              child: SectionHeader(title: localization.newRequests),
            ),
            const NewRequestsList(),
          ],
        );
      },
    );
  }
}
