import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';

enum MenuItemType { helpSupport, privacySecurity, language, reviews }

extension MenuItemTypeExtension on MenuItemType {
  String localizedMenuTitle(BuildContext context) {
    final localization = context.localization;
    switch (this) {
      case MenuItemType.helpSupport:
        return localization.helpSupport;
      case MenuItemType.privacySecurity:
        return localization.privacySecurity;
      case MenuItemType.language:
        return localization.language;
      case MenuItemType.reviews:
        return localization.reviews;
    }
  }
}
