import 'package:flutter/material.dart';
import '../../../../models/request_model.dart';
import 'buttom_sheet_action_buttons.dart';

class RequestDetailsBottomSheet extends StatelessWidget {
  const RequestDetailsBottomSheet({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تفاصيل الخدمة", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text("الخدمة: ${request.service}"),
          Text("العميل: ${request.customerName}"),
          Text("التاريخ: ${request.date}"),
          const SizedBox(height: 10),
          Text("الوصف: ${request.details}"),
          const SizedBox(height: 20),
          BottomSheetActionButtons(request: request,),
        ],
      ),
    );
  }
}
