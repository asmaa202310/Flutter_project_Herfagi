import 'package:flutter/material.dart';
import '../models/old/crafter_model.dart';
import '../models/old/service_model.dart';
import '../utils/get_localize_title.dart';

class HomeUserViewModel extends ChangeNotifier {
  // final List<CategoryModel> categories = [
  //   CategoryModel(
  //     key: ServiceKey.electrician,
  //     icon: Icons.flash_on,
  //     color: Colors.yellow,
  //   ),
  //   CategoryModel(
  //     key: ServiceKey.carpenter,
  //     icon: Icons.handyman,
  //     color: Colors.orange,
  //   ),
  //   CategoryModel(
  //     key: ServiceKey.plumber,
  //     icon: Icons.water_damage,
  //     color: Colors.blue,
  //   ),
  //   CategoryModel(
  //     key: ServiceKey.painter,
  //     icon: Icons.format_paint,
  //     color: Colors.purple,
  //   ),
  //   CategoryModel(
  //     key: ServiceKey.blacksmith,
  //     icon: Icons.build,
  //     color: Colors.green,
  //   ),
  // ];

  final List<CrafterModel> topCrafters = [
    CrafterModel(
      name: "أحمد النجار",
      service: ServiceKey.carpenter,
      rating: 4.8,
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    CrafterModel(
      name: "محمد السباك",
      service: ServiceKey.plumber,
      rating: 4.6,
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    CrafterModel(
      name: "خالد الكهربائي",
      service: ServiceKey.electrician,
      rating: 4.9,
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
  ];

  static final List<ServiceModel> servicesList = [
    ServiceModel(
      name: "أحمد النجار",
      service: ServiceKey.carpenter,
      rating: 4.7,
      price: "200",
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    ServiceModel(
      name: "محمد السباك",
      service: ServiceKey.plumber,
      rating: 4.5,
      price: "180",
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    ServiceModel(
      name: "خالد الكهربائي",
      service: ServiceKey.electrician,
      rating: 4.9,
      price: "250",
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
    ServiceModel(
      name: "علي الدهان",
      service: ServiceKey.painter,
      rating: 4.6,
      price: "220",
      icon: Icons.format_paint,
      color: Colors.purple,
    ),
    ServiceModel(
      name: "محمود الحداد",
      service: ServiceKey.blacksmith,
      rating: 4.4,
      price: "300",
      icon: Icons.construction,
      color: Colors.grey,
    ),
  ];
}
