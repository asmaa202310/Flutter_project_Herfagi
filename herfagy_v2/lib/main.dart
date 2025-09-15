import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/constants/app_colors.dart';
import 'package:herfagy_v2/services/setup.dart';
import 'package:herfagy_v2/services/start_page_loader.dart';
import 'package:herfagy_v2/viewmodels/language_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/viewmodels/theme_view_model.dart';
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
        ChangeNotifierProvider(create: (_) => ProfileOperationViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => ServiceOperationViewModel()),
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
    final themeProvider = context.watch<ThemeViewModel>();

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

      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: const StartPageLoader(),
    );
  }
}

//ProfileListTileWidget

// theme: ThemeData(
//         fontFamily: 'NotoSansArabic_Condensed-Regular',
//         scaffoldBackgroundColor: Colors.white,
//       ),
