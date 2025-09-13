import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/orders_for_user_view_model.dart';
import 'custom_orders_app_bar.dart';
import 'orders_sliver_list_builder.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersForUserViewModel>(
      builder: (context, viewModel, child) {
        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.bookings),
            OrdersSliverListBuilderForCrafter(orders: viewModel.ordersList),
          ],
        );
      },
    );
  }
}
