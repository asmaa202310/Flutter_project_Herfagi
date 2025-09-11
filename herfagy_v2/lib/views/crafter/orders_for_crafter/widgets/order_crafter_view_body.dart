import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import '/viewmodels/orders_for_crafter_view_model.dart';
import 'package:provider/provider.dart';
import '../../../user/orders_for_user/widgets/custom_orders_app_bar.dart';
import '../../../user/orders_for_user/widgets/orders_sliver_list_builder.dart';

class OrdersCrafterViewBody extends StatelessWidget {
  const OrdersCrafterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersForCrafterViewModel>(
      builder: (context, viewModel, child) {
        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.orders),
            OrdersSliverListBuilderForCrafter(orders: viewModel.ordersList),
          ],
        );
      },
    );
  }
}
