import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/utils/deep_link_handler.dart';

import 'package:herfagy_v2/viewmodels/language_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/generated/l10n.dart';
import '/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';

const supabaseUrl = "https://gsevnwfporzdaazrbwhb.supabase.co";
const supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdzZXZud2Zwb3J6ZGFhenJid2hiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcyNjk1MDYsImV4cCI6MjA3Mjg0NTUwNn0.5UpiVS5z_42OnHxzWtSy7tO-_957UfCVKjZB6o2Q-B0";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
      ],
      child: const HerfagyApp(),
    ),
  );
}

class HerfagyApp extends StatelessWidget {
  const HerfagyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageViewModel>(context);
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
      locale: languageProvider.locale,

      theme: ThemeData(
        fontFamily: 'NotoSansArabic_Condensed-Regular',
        scaffoldBackgroundColor: Colors.white,
        dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      ),

      home: Stack(children: const [CrafterView(), DeepLinkHandler()]),
    );
  }
}

// theme: ThemeData(
//         fontFamily: 'NotoSansArabic_Condensed-Regular',
//         scaffoldBackgroundColor: Colors.white,
//       ),
