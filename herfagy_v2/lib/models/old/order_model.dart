import '/utils/get_localize_title.dart';

import '/utils/get_order_status_extension.dart';

class OrderModel {
  final ServiceKey service;
  final String person;
  final String date;
  final OrderStatus status;
  final String details;

  const OrderModel({
    required this.service,
    required this.person,
    required this.date,
    required this.status,
    required this.details,
  });
}
