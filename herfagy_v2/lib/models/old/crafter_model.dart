import 'package:flutter/material.dart';

class CrafterModel {
  final String serviceKey;
  final String name;
  final double rating;
  final IconData icon;
  final Color color;

  CrafterModel({
    required this.name,
    required this.serviceKey,
    required this.rating,
    required this.icon,
    required this.color,
  });
}
