class Order {
  final int serviceId;
  final String customerId;
  final String crafterId;
  final DateTime date;
  final String state;

  Order({
    required this.serviceId,
    required this.customerId,
    required this.crafterId,
    required this.date,
    required this.state,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      serviceId: map['service_id'],
      customerId: map['customer_id'],
      crafterId: map['crafter_id'],
      date: DateTime.parse(map['date']),
      state: map['state'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'service_id': serviceId,
      'customer_id': customerId,
      'crafter_id': crafterId,
      'date': date.toIso8601String(),
      'state': state,
    };
  }
}
