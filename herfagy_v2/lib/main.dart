import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/generated/l10n.dart';
import '/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

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
      home: const OnboardingView(),
    );
  }
}
