import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herfagy_v2/app_config.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/modelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGoogleModelView {
  final SupabaseClient supabaseClient = sl<SupabaseClient>();
  final ProfileOperationViewModel _profileOps = sl<ProfileOperationViewModel>();

  Future<void> signInWithGoogle() async {
    try {
      const webClientId = AppConfig.webClientId;
      const androidClientId = AppConfig.androidClientId;
      final GoogleSignIn signIn = GoogleSignIn.instance;
      signIn.initialize(clientId: androidClientId, serverClientId: webClientId);

      final googleAccount = await signIn.authenticate();
      final idToken = googleAccount.authentication.idToken;

      if (idToken == null) {
        throw 'No ID Token found.';
      }
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );

      final user = response.user;
      if (user == null) throw 'Supabase user not found';

      final profileData = Profile(
        id: user.id,
        username:
            user.userMetadata?['name'] ?? googleAccount.displayName ?? 'NoName',
        email: user.email ?? 'NoEmail',
      );

      await _profileOps.addProfile(profileData);

      log('Google sign-in successful!');
    } catch (e) {
      log('Google Sign-In Error: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
