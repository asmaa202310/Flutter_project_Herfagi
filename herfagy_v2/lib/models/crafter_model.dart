import 'package:flutter/material.dart';

class CrafterModel {
  final String service;
  final String name;
  final double rating;
  final IconData icon;
  final Color color;

  CrafterModel({
    required this.name,
    required this.service,
    required this.rating,
    required this.icon,
    required this.color,
  });
}

