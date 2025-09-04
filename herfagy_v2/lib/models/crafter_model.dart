import 'package:flutter/material.dart';

class CrafterModel {
  final String name;
  final String service;
  final double rating;
  final String price;
  final IconData icon;
  final Color color;

  CrafterModel({
    required this.name,
    required this.service,
    required this.rating,
    required this.price,
    required this.icon,
    required this.color,
  });
}
