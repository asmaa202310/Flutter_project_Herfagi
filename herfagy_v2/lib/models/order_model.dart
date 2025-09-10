class OrderModel {
  final String service;
  final String person;
  final String date;
  final String status;
  final String details;

  const OrderModel({
    required this.service,
    required this.person,
    required this.date,
    required this.status,
    required this.details,
  });
}