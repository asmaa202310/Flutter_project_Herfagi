import 'package:flutter/material.dart';

import 'package:herfagy_v2/utils/get_localize_title.dart';

class CrafterModel {
  final ServiceKey service;
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
