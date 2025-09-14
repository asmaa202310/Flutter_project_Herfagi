import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/utils/deep_link_handler.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/onboarding/onboarding_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:supabase_flutter/supabase_flutter.dart';

class StartPageLoader extends StatelessWidget {
  const StartPageLoader({super.key});

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
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
    );
  }
}
