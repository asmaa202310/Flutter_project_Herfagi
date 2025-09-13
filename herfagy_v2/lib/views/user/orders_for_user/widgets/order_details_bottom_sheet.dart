import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/views/crafter/orders_for_crafter/widgets/custom_text_close_button.dart';
import '../../../crafter/orders_for_crafter/widgets/order_status_widget.dart';
import '/models/old/order_model.dart';
import '/utils/localization_extension.dart';

enum OrderViewerType { user, crafter }

class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({
    super.key,
    required this.order,
    required this.viewerType,
  });

  final OrderModel order;
  final OrderViewerType viewerType;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    final String personLabel = viewerType == OrderViewerType.user
        ? localization.craftsman
        : localization.customer;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.serviceDetails,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "${localization.service}: ${GetLocalizeTitle.getLocalizedTitle(context, order.service)}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "$personLabel: ${order.person}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "${localization.date}: ${order.date}",
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          const SizedBox(height: 8),
          OrderStatusWidget(order: order),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            "${localization.description}:",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            order.details,
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          const CustomTextCloseButton(),
        ],
      ),
    );
  }
}