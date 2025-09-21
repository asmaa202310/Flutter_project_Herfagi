class Profile {
  final String id;
  final String username;
  final String email;
  final String? role;
  final int? serviceId;
  final double? price;
  final String? imageUrl;
  final String? location;
  final String? phone;
  final String? imageUrlId;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    this.role,
    this.serviceId,
    this.price,
    this.imageUrl,
    this.location,
    this.phone,
    this.imageUrlId,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      role: map['role'],
      serviceId: map['service_id'],
      price: map['price']?.toDouble(),
      imageUrl: map['imageUrl'],
      location: map['location'],
      phone: map['phone'],
      imageUrlId: map['imageUrl_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'role': role,
      'service_id': serviceId,
      'price': price,
      'imageUrl': imageUrl,
      'location': location,
      'phone': phone,
      'imageUrl_id': imageUrlId,
    };
  }
}
