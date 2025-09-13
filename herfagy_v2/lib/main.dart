import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import 'package:herfagy_v2/views/user_type_selection.dart';
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
      home: StreamBuilder<AuthState>(
        stream: supabaseClient.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final session = snapshot.data?.session;

          if (session == null) {
            
            return const OnboardingView();
          }

          
          return FutureBuilder(
            future: supabaseClient
                .from('profiles')
                .select('role')
                .eq('id', session.user.id)
                .maybeSingle(),
            builder: (context, profileSnapshot) {
              if (profileSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (profileSnapshot.hasError) {
                return const Center(child: Text("Error loading profile"));
              }

              final profile = profileSnapshot.data;

              if (profile == null || profile['role'] == null) {
                return const UserTypeSelection();
              }

              final role = profile['role'];

              if (role == "User") {
                return const UserView();
              } else if (role == "Crafter") {
                return const CrafterView();
              } else {
                return const UserTypeSelection();
              }
            },
          );
        },
      ),
    );
  }
}
