import 'package:flutter/material.dart';
import '../../../../models/order_model.dart';
import '../../home_for_user/widgets/custom_order_button.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  Color getStatusColor(String status) {
    switch (status) {
      case "مكتمل":
        return Colors.green;
      case "قيد التنفيذ":
        return Colors.orange;
      case "جديد":
        return Colors.blue;
      case "مرفوض":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الخدمة: ${order.service}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "الحرفى: ${order.person}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "📅 التاريخ: ${order.date}",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text("الحالة: ", style: TextStyle(color: Colors.grey[800])),
                Text(
                  order.status,
                  style: TextStyle(color: getStatusColor(order.status)),
                ),
                const Spacer(),
                CustomOrderButton(
                  borderRaduis: 16,
                  text: 'التفاصيل',
                  fontSize: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
