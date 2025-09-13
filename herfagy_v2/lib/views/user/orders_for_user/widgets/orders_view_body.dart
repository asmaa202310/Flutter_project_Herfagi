import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/orders_for_user_view_model.dart';
import 'custom_general_app_bar.dart';
import 'order_details_bottom_sheet.dart';
import 'orders_sliver_list_builder.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersForUserViewModel>(
      builder: (context, viewModel, child) {
        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.bookings),
            OrdersSliverListBuilder(
              orders: viewModel.ordersList,
              viewerType: OrderViewerType.user,
            ),
          ],
        );
      },
    );
  }
}
