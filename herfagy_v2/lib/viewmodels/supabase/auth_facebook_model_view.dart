import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthFacebookModelView {
  final SupabaseClient supabaseClient = sl<SupabaseClient>();
  final ProfileOperationViewModel _profileOps = sl<ProfileOperationViewModel>();

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status != LoginStatus.success) {
        throw 'Facebook login failed: ${result.status}';
      }

      final accessToken = result.accessToken?.tokenString;
      if (accessToken == null) {
        throw 'No Facebook access token found';
      }

      await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: "herfagy://facebook-login",
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
      final user = supabaseClient.auth.currentUser;
      if (user == null) return;
      final userData = await FacebookAuth.instance.getUserData(
        fields: "id,name,email",
      );

      final profileData = Profile(
        id: user.id,
        username: userData['name'] ?? 'NoName',
        email: userData['email'] ?? "NoEmail",
      );

      await _profileOps.addProfile(profileData);

      log('Facebook sign-in successful!');
    } catch (e) {
      log('Facebook Sign-In Error: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {}
}
