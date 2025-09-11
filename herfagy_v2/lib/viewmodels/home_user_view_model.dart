import 'package:flutter/material.dart';
import '../models/old/categoty_model.dart';
import '../models/old/crafter_model.dart';
import '../models/old/service_model.dart';

class HomeUserViewModel {
  static final List<CategoryModel> categories = [
    CategoryModel(
      key: "electrician",
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
    CategoryModel(key: "carpenter", icon: Icons.handyman, color: Colors.orange),
    CategoryModel(key: "plumber", icon: Icons.water_damage, color: Colors.blue),
    CategoryModel(
      key: "painter",
      icon: Icons.format_paint,
      color: Colors.purple,
    ),
    CategoryModel(key: "blacksmith", icon: Icons.build, color: Colors.green),
  ];

  static final List<CrafterModel> topCrafters = [
    CrafterModel(
      name: "أحمد النجار",
      serviceKey: "carpenter",
      rating: 4.8,
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    CrafterModel(
      name: "محمد السباك",
      serviceKey: "plumber",
      rating: 4.6,
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    CrafterModel(
      name: "خالد الكهربائي",
      serviceKey: "electrician",
      rating: 4.9,
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
  ];

  static final List<ServiceModel> servicesList = [
    ServiceModel(
      name: "أحمد النجار",
      serviceKey: "carpenter",
      rating: 4.7,
      price: "200",
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    ServiceModel(
      name: "محمد السباك",
      serviceKey: "plumber",
      rating: 4.5,
      price: "180",
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    ServiceModel(
      name: "خالد الكهربائي",
      serviceKey: "electrician",
      rating: 4.9,
      price: "250",
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
    ServiceModel(
      name: "علي الدهان",
      serviceKey: "painter",
      rating: 4.6,
      price: "220",
      icon: Icons.format_paint,
      color: Colors.purple,
    ),
    ServiceModel(
      name: "محمود الحداد",
      serviceKey: "blacksmith",
      rating: 4.4,
      price: "300",
      icon: Icons.construction,
      color: Colors.grey,
    ),
  ];
}
