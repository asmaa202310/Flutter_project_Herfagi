import 'package:flutter/material.dart';

import '../models/old/menu_items_model.dart';
import '../views/change_language/change_language_view.dart';

class ProfileCrafterViewModel {
  static List<MenuItemModel> menuItems(BuildContext context) => [
    MenuItemModel(
      icon: Icons.rate_review,
      title: 'التقييمات',
      color: Colors.amber,
    ),
    MenuItemModel(
      icon: Icons.help_outline,
      title: 'المساعدة والدعم',
      color: Colors.teal,
    ),
    MenuItemModel(
      icon: Icons.security,
      title: 'الخصوصية والأمان',
      color: Colors.indigo,
    ),
    MenuItemModel(
      icon: Icons.language,
      title: 'اللغة',
      color: Colors.brown,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ChangeLanguageView()),
        );
      },
    ),
  ];
}
