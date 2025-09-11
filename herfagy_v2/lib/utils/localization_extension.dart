import 'package:flutter/material.dart';
import '../generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get localization => S.of(this);
}
