import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_menu_item_type_extension.dart';

class MenuItemModel {
  final IconData icon;
  final MenuItemType type;
  final Color color;
  final void Function(BuildContext context)? onTap;

  const MenuItemModel({
    required this.icon,
    required this.type,
    required this.color,
    this.onTap,
  });
}
