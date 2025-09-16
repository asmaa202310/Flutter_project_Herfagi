import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../../viewmodels/language_view_model.dart';
import '../../user/orders_for_user/widgets/custom_general_app_bar.dart';
import 'language_tile.dart';

class ChangeLanguageViewBody extends StatelessWidget {
  const ChangeLanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageViewModel>(context, listen: false);
    return CustomScrollView(
      slivers: [
        CustomGeneralSliverAppBar(
          text: S.of(context).changeLanguage,
          automaticallyImplyLeading: true,
        ),
        SliverList.list(
          children: [
            LanguageTile(
              title: "English",
              locale: const Locale('en'),
              selected: provider.locale.languageCode == 'en',
              onTap: () => provider.changeLanguage(const Locale('en')),
            ),
            LanguageTile(
              title: "العربية",
              locale: const Locale('ar'),
              selected: provider.locale.languageCode == 'ar',
              onTap: () => provider.changeLanguage(const Locale('ar')),
              titleStyle: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
