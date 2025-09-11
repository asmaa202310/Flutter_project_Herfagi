import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../generated/l10n.dart';

class GetLocalizeTitle {
  static String getLocalizedTitle(BuildContext context, String key) {
    switch (key) {
      case "electrician":
        return context.localization.electrician;
      case "carpenter":
        return context.localization.carpenter;
      case "plumber":
        return context.localization.plumber;
      case "painter":
        return context.localization.painter;
      case "blacksmith":
        return S.of(context).blacksmith;
      case "airConditioning":
        return context.localization.airConditioning;
      default:
        return key;
    }
  }
}
