import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';

enum OrderStatus { newOrder, inProgress, completed, rejected }

extension OrderStatusExtension on OrderStatus {
  String localizedText(BuildContext context) {
    final localization = context.localization;
    switch (this) {
      case OrderStatus.completed:
        return localization.completed; 
      case OrderStatus.inProgress:
        return localization.inProgress;
      case OrderStatus.newOrder:
        return localization.newOrder;
      case OrderStatus.rejected:
        return localization.rejected;
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.inProgress:
        return Colors.orange;
      case OrderStatus.newOrder:
        return Colors.blue;
      case OrderStatus.rejected:
        return Colors.red;
    }
  }
}
