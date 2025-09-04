import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/views/home_for_user/home_user_view.dart';
import '/generated/l10n.dart';
import '/viewmodels/onboarding_view_model.dart';
import '/views/onboarding/onboarding_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: const HerfagyApp(),
    ),
  );
}

class HerfagyApp extends StatelessWidget {
  const HerfagyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حرفجى',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      /// to change local language || Locale('en'),
      locale: Locale('ar'),
      theme: ThemeData(
        fontFamily: 'NotoSansArabic_Condensed-Regular',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeUserView(),
    );
  }
}
