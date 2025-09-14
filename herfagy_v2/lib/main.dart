import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/utils/deep_link_handler.dart';
import 'package:herfagy_v2/viewmodels/language_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
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
        ChangeNotifierProvider(create: (_) => ProfileOperationViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileOperationViewModel()),
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

      home: FutureBuilder<Widget>(
        future: _determineStartPage(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            return Stack(children: [snapshot.data!, const DeepLinkHandler()]);
          } else {
            return const Scaffold(body: Center(child: Text('حدث خطأ')));
          }
        },
      ),
    );
  }

  Future<Widget> _determineStartPage(BuildContext context) async {
    try {
      Provider.of<AuthViewModel>(context, listen: false);
      final profileOps = Provider.of<ProfileOperationViewModel>(
        context,
        listen: false,
      );
      final SupabaseClient supabaseClient = sl<SupabaseClient>();
      final session = supabaseClient.auth.currentSession;

      if (session == null) {
        return const OnboardingView();
      }

      await profileOps.loadProfiles();

      final profile = profileOps.profiles.firstWhereOrNull(
        (p) => p.id == session.user.id,
      );

      if (profile == null) {
        return const OnboardingView();
      } else if (profile.role?.toLowerCase() == 'crafter') {
        return const CrafterView();
      } else {
        return const UserView();
      }
    } catch (e, st) {
      debugPrint('Error in _determineStartPage: $e');
      debugPrint('$st');
      return const Scaffold(body: Center(child: Text('حدث خطأ')));
    }
  }
}

// theme: ThemeData(
//         fontFamily: 'NotoSansArabic_Condensed-Regular',
//         scaffoldBackgroundColor: Colors.white,
//       ),
