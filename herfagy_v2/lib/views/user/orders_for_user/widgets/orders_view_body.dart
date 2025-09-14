import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'custom_general_app_bar.dart';
import 'order_details_bottom_sheet.dart';
import 'orders_sliver_list_builder.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderOperationViewModel>(
      builder: (context, viewModel, child) {
        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.bookings),
            OrdersSliverListBuilder(
              orders: viewModel.orders,
              viewerType: OrderViewerType.user,
            ),
          ],
        );
      },
    );
  }
}
