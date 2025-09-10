class Profile {
  final String id;
  final String username;
  final String? role;
  final int? serviceId;
  final double? price;

  Profile({
    required this.id,
    required this.username,
    this.role,
    this.serviceId,
    this.price,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      username: map['username'],
      role: map['role'],
      serviceId: map['service_id'],
      price: map['price']?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'role': role,
      'service_id': serviceId,
      'price': price,
    };
  }
}
