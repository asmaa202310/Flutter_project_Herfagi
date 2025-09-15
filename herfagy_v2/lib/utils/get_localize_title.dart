import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';

enum ServiceKey {
  electrician,
  carpenter,
  plumber,
  painter,
  blacksmith,
  airConditioning,
}

class GetLocalizeTitle {
  static String getLocalizedTitle(BuildContext context, ServiceKey key) {
    final localization = context.localization;
    switch (key) {
      case ServiceKey.electrician:
        return localization.electrician;
      case ServiceKey.carpenter:
        return localization.carpenter;
      case ServiceKey.plumber:
        return localization.plumber;
      case ServiceKey.painter:
        return localization.painter;
      case ServiceKey.blacksmith:
        return localization.blacksmith;
      case ServiceKey.airConditioning:
        return localization.airConditioning;
    }
  }

  List<String> getServices(BuildContext context) {
    return ServiceKey.values.map((key) {
      return GetLocalizeTitle.getLocalizedTitle(context, key);
    }).toList();
  }
}
