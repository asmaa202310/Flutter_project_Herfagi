import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final Color color;
  final void Function(BuildContext context)? onTap;

  const MenuItemModel({
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  });
}