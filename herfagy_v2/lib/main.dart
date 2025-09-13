import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/utils/deep_link_handler.dart';

import 'package:herfagy_v2/viewmodels/language_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import 'package:herfagy_v2/views/user_type_selection/user_type_selection_view.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/user_type_selection/widgets/user_type_selection_view_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/generated/l10n.dart';
import '/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
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
    final supabaseClient = sl<SupabaseClient>();
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

      home: StreamBuilder<AuthState>(
            stream: supabaseClient.auth.onAuthStateChange,
            builder: (context, snapshot) {
              if (snapshot.data?.session != null) {
                return Stack(
                  children: const [OnboardingView(), DeepLinkHandler()],
                );
              } else {
                return Stack(
                  children: const [OnboardingView(), DeepLinkHandler()],
                );
              }
            },
          ),
    );
  }
}

// theme: ThemeData(
//         fontFamily: 'NotoSansArabic_Condensed-Regular',
//         scaffoldBackgroundColor: Colors.white,
//       ),
