import 'crafter_model.dart';

class ServiceModel extends CrafterModel {
  final String price;

  ServiceModel({
    required this.price,
    required super.name,
    required super.service,
    required super.rating,
    required super.icon,
    required super.color,
  });
}
