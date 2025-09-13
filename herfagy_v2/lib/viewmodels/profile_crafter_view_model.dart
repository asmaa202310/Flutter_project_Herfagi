import 'package:flutter/material.dart';

import '../models/old/menu_items_model.dart';
import '../utils/get_menu_item_type_extension.dart';
import '../views/change_language/change_language_view.dart';
import '../views/reviews/reviews_view.dart';

class ProfileCrafterViewModel {
  static List<MenuItemModel> menuItems(BuildContext context) => [
    MenuItemModel(
      icon: Icons.rate_review,
      type: MenuItemType.reviews,
      color: Colors.amber,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CrafterReviewsView()),
        );
      },
    ),
    MenuItemModel(
      icon: Icons.help_outline,
      type: MenuItemType.helpSupport,
      color: Colors.teal,
    ),
    MenuItemModel(
      icon: Icons.security,
      type: MenuItemType.privacySecurity,
      color: Colors.indigo,
    ),
    MenuItemModel(
      icon: Icons.language,
      type: MenuItemType.language,
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
