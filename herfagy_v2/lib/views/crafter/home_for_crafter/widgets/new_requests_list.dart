import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_order_status_extension.dart';
import 'package:herfagy_v2/views/user/orders_for_user/widgets/order_details_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../../user/orders_for_user/widgets/order_card.dart';
import '/utils/localization_extension.dart';
import '../../../../viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';

class NewRequestsList extends StatelessWidget {
  const NewRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderOperationViewModel>(
      builder: (context, viewModel, child) {
        final newOrders = viewModel.orders
            .where((order) => order.status == OrderStatus.newOrder)
            .toList();

        if (newOrders.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(context.localization.noNewRequests),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final order = newOrders[index];
            return OrderCard(
              key: ValueKey("${order.customerId}-${order.serviceId}"),
              order: order,
              viewerType: OrderViewerType.crafter,
            );
          }, childCount: newOrders.length),
        );
      },
    );
  }
}
