import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_order_status_extension.dart';
import 'package:provider/provider.dart';
import '../../../../models/order.dart';
import '../../../../utils/localization_extension.dart';
import '../../../../viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'reject_accept_button.dart';

class BottomSheetActionButtons extends StatelessWidget {
  const BottomSheetActionButtons({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final ordersVM = Provider.of<OrderOperationViewModel>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RejectAcceptButton(
          buttonColor: Colors.green,
          text: context.localization.accept,
          icon: Icons.check,
          onTap: () async {
            final updatedOrder = Order(
              serviceId: order.serviceId,
              customerId: order.customerId,
              crafterId: order.crafterId,
              date: order.date,
              details: order.details,
              status: OrderStatus.inProgress,
            );
            await ordersVM.updateOrder(updatedOrder);
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 10),
        RejectAcceptButton(
          buttonColor: Colors.red,
          text: context.localization.reject,
          icon: Icons.close,
          onTap: () async {
            final updatedOrder = Order(
              serviceId: order.serviceId,
              customerId: order.customerId,
              crafterId: order.crafterId,
              date: order.date,
              details: order.details,
              status: OrderStatus.rejected,
            );
            await ordersVM.updateOrder(updatedOrder);
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
