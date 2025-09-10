class Rating {
  final String customerId;
  final String crafterId;
  final int rate;

  Rating({
    required this.customerId,
    required this.crafterId,
    required this.rate,
  });

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      customerId: map['customer_id'],
      crafterId: map['crafter_id'],
      rate: map['rate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customer_id': customerId,
      'crafter_id': crafterId,
      'rate': rate,
    };
  }
}
