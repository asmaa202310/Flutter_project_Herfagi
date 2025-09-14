import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/utils/get_order_status_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';

class Order {
  final int serviceId;
  final String customerId;
  final String crafterId;
  final DateTime date;
  final OrderStatus status;
  final String details;

  Order({
    required this.serviceId,
    required this.customerId,
    required this.crafterId,
    required this.date,
    required this.status,
    required this.details,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      serviceId: map['service_id'],
      customerId: map['customer_id'],
      crafterId: map['crafter_id'],
      date: DateTime.parse(map['date']),
      status: _statusFromString(map['status']),
      details: map['details'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'service_id': serviceId,
      'customer_id': customerId,
      'crafter_id': crafterId,
      'date': date.toIso8601String(),
      'status': _statusToString(status),
      'details': details,
    };
  }

  Future<Service> getService() async {
    return await sl<OrderOperationViewModel>().getServiceForOrder(this);
  }

  Future<String> person(String viewerType) async {
    if (viewerType == "user") {
      final profile = await sl<OrderOperationViewModel>().getProfile(crafterId);
      return profile.username;
    } else {
      final profile = await sl<OrderOperationViewModel>().getProfile(
        customerId,
      );
      return profile.username;
    }
  }

  static OrderStatus _statusFromString(String status) {
    switch (status.toLowerCase()) {
      case 'new':
      case 'neworder':
        return OrderStatus.newOrder;
      case 'inprogress':
        return OrderStatus.inProgress;
      case 'completed':
        return OrderStatus.completed;
      case 'rejected':
        return OrderStatus.rejected;
      default:
        return OrderStatus.newOrder;
    }
  }

  static String _statusToString(OrderStatus status) {
    switch (status) {
      case OrderStatus.newOrder:
        return 'new';
      case OrderStatus.inProgress:
        return 'inProgress';
      case OrderStatus.completed:
        return 'completed';
      case OrderStatus.rejected:
        return 'rejected';
    }
  }
}
