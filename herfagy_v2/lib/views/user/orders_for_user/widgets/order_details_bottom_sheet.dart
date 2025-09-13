import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_localize_title.dart';
import 'package:herfagy_v2/views/crafter/orders_for_crafter/widgets/custom_text_close_button.dart';
import '/models/old/order_model.dart';
import '/utils/localization_extension.dart';

class OrderDetailsBottomSheetForUser extends StatelessWidget {
  const OrderDetailsBottomSheetForUser({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.serviceDetails,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "${localization.service}: ${GetLocalizeTitle.getLocalizedTitle(context, order.service)}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "${localization.customer}: ${order.person}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "الحالة: ${order.status}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            "الوصف:",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
