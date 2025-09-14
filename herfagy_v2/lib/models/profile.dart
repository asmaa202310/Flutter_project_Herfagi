class Profile {
  final String id;
  final String username;
  final String email;
  final String? role;
  final int? serviceId;
  final double? price;
  final String? imageUrl;
  final String? location;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    this.role,
    this.serviceId,
    this.price,
    this.imageUrl,
    this.location,
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
    };
  }
}
