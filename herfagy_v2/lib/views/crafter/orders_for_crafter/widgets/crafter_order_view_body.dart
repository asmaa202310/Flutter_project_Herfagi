import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/order_details_bottom_sheet.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/orders_sliver_list_builder.dart';
import 'package:provider/provider.dart';

class CrafterOrdersViewBody extends StatelessWidget {
  const CrafterOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );
    final orderVM = Provider.of<OrderOperationViewModel>(context);

    return FutureBuilder<Profile?>(
      future: profileVM.getCurrentUserProfile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final crafter = snapshot.data!;
        final crafterOrders = orderVM.getOrdersForCrafter(crafter.id);

        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.orders),
            OrdersSliverListBuilder(
              orders: crafterOrders,
              viewerType: OrderViewerType.crafter,
            ),
          ],
        );
      },
    );
  }
}
