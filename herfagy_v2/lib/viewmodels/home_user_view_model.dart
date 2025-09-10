import 'package:flutter/material.dart';
import '../models/categoty_model.dart';
import '../models/crafter_model.dart';
import '../models/service_model.dart';

class HomeUserViewModel {
  static final List<CategoryModel> categories = [
    CategoryModel(title: "كهربائي", icon: Icons.flash_on, color: Colors.yellow),
    CategoryModel(title: "نجار", icon: Icons.handyman, color: Colors.orange),
    CategoryModel(title: "سباك", icon: Icons.water_damage, color: Colors.blue),
    CategoryModel(
      title: "دهان",
      icon: Icons.format_paint,
      color: Colors.purple,
    ),
    CategoryModel(title: "حداد", icon: Icons.build, color: Colors.green),
  ];
  static final List<CrafterModel> topCrafters = [
    CrafterModel(
      name: "أحمد النجار",
      service: "نجار",
      rating: 4.8,
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    CrafterModel(
      name: "محمد السباك",
      service: "سباك",
      rating: 4.6,
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    CrafterModel(
      name: "خالد الكهربائي",
      service: "كهربائي",
      rating: 4.9,
      icon: Icons.flash_on,
      color: Colors.yellow,
    ),
  ];
  static List<ServiceModel> servicesList = [
    ServiceModel(
      name: "أحمد النجار",
      service: "نجارة",
      rating: 4.7,
      price: "200",
      icon: Icons.handyman,
      color: Colors.orange,
    ),
    ServiceModel(
      name: "محمد السباك",
      service: "سباكة",
      rating: 4.5,
      price: "180",
      icon: Icons.water_damage,
      color: Colors.blue,
    ),
    ServiceModel(
      name: "خالد الكهربائي",
      service: "كهرباء",
      rating: 4.9,
      price: "250",
      icon: Icons.flash_on,
      color: Colors.yellow.shade700,
    ),
    ServiceModel(
      name: "علي الدهان",
      service: "دهانات",
      rating: 4.6,
      price: "220",
      icon: Icons.format_paint,
      color: Colors.purple,
    ),
    ServiceModel(
      name: "محمود الحداد",
      service: "حدادة",
      rating: 4.4,
      price: "300",
      icon: Icons.construction,
      color: Colors.grey.shade800,
    ),
    ServiceModel(
      name: "يوسف المبلط",
      service: "تشطيبات سيراميك",
      rating: 4.3,
      price: "150",
      icon: Icons.grid_on,
      color: Colors.brown,
    ),
    ServiceModel(
      name: "إبراهيم التكييف",
      service: "صيانة تكييف",
      rating: 4.8,
      price: "400",
      icon: Icons.ac_unit,
      color: Colors.lightBlue,
    ),
    ServiceModel(
      name: "سامي الزجاج",
      service: "تركيب زجاج",
      rating: 4.2,
      price: "180",
      icon: Icons.window,
      color: Colors.cyan,
    ),
    ServiceModel(
      name: "طارق الألوميتال",
      service: "شبابيك ألوميتال",
      rating: 4.6,
      price: "350",
      icon: Icons.apartment,
      color: Colors.teal,
    ),
    ServiceModel(
      name: "مروان السباك",
      service: "إصلاح مواسير",
      rating: 4.7,
      price: "170",
      icon: Icons.plumbing,
      color: Colors.indigo,
    ),
  ];
}
