import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/old/order_model.dart';



class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "تفاصيل الطلب",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "الخدمة: ${order.service}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text("الحرفي: ${order.person}", style: const TextStyle(fontSize: 16)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("إغلاق"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
