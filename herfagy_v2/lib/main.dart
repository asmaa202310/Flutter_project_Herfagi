import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/constants/app_colors.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/start_page_loader.dart';
import 'package:herfagy_v2/viewmodels/language_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/viewmodels/theme_view_model.dart';
import 'package:herfagy_v2/views/book_now/book_now_view.dart';
import 'package:herfagy_v2/views/forget_password/forget_password_view.dart';
import 'package:herfagy_v2/views/login/login_view.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:herfagy_v2/views/profile_overview/profile_overview_view.dart';
import 'package:herfagy_v2/views/user/home_for_user/home_user_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import 'package:herfagy_v2/views/user_type_selection/user_type_selection_view.dart';
import '/generated/l10n.dart';
import '/viewmodels/onboarding_view_model.dart';
import 'package:provider/provider.dart';

import 'views/category_details/category_details_view.dart';
import 'views/complete_information/complete_info_view.dart';
import 'views/forget_password/update_password_view.dart';

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
