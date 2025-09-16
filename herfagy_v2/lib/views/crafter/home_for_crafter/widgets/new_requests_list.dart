import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/order.dart';
import '../../../../viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import '../../../../viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'request_card.dart';
import '../../../../utils/get_order_status_extension.dart';
import '../../../../utils/localization_extension.dart';

class NewRequestsList extends StatelessWidget {
  const NewRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileOperationViewModel>(context, listen: false);

    return FutureBuilder(
      future: profileVM.getCurrentUserProfile(),
      builder: (context, profileSnapshot) {
        if (!profileSnapshot.hasData) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final crafterId = profileSnapshot.data!.id;

        return Consumer<OrderOperationViewModel>(
          builder: (context, orderVM, child) {
            final newOrders = orderVM.orders
                .where((Order order) =>
                    order.status == OrderStatus.newOrder &&
                    order.crafterId == crafterId)
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
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final order = newOrders[index];
                  return RequestCard(
                    key: ValueKey("${order.customerId}-${order.serviceId}"),
                    order: order,
                  );
                },
                childCount: newOrders.length,
              ),
            );
          },
        );
      },
    );
  }
}
