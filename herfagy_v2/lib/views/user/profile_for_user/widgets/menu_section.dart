import 'package:flutter/material.dart';
import '../../../../models/old/menu_items_model.dart';
import 'menu_item.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, required this.items});
  final List<MenuItemModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return MenuItem(
          icon: item.icon,
          title: item.title,
          color: item.color,
          onTap: item.onTap != null ? () => item.onTap!(context) : null,
        );
      },
    );
  }
}
