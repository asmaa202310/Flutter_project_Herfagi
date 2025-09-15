class Service {
  final int id;
  final String name;
  final String iconName;

  Service({required this.id, required this.name, required this.iconName});

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      name: map['name'],
      iconName: map['iconName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'iconName': iconName};
  }
}
