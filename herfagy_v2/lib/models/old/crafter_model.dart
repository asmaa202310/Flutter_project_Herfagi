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

class CraftsmanModel {
  final String name;
  final String profession;
  final String location;
  final String profileImage;
  final List<String> gallery;
  final double rating;
  final int completedProjects;

  CraftsmanModel({
    required this.name,
    required this.profession,
    required this.location,
    required this.profileImage,
    required this.gallery,
    required this.rating,
    required this.completedProjects,
  });
}