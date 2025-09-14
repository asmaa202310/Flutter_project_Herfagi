import 'dart:developer';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/modelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthFacebookModelView {
  final SupabaseClient supabaseClient = sl<SupabaseClient>();
  final ProfileOperationViewModel _profileOps = sl<ProfileOperationViewModel>();

  Profile? profile;

  Future<Profile?> signInWithFacebook() async {
    try {
      await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: "herfagy://facebook-login",
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        log("No Supabase user returned after Facebook login");
        return null;
      }

      final existingProfile = _profileOps.profiles.firstWhere(
        (p) => p.id == user.id,
        orElse: () => Profile(id: user.id, username: '', email: ''),
      );

      final profileData = Profile(
        id: user.id,

        username: user.userMetadata?['name'] ?? 'NoName',
        email: user.email ?? 'NoEmail',
        role: existingProfile.role,
      );

      profile = profileData;

      await _profileOps.addProfile(profileData);

      log(' Facebook sign-in successful!');
      return profileData;
    } catch (e, st) {
      log(' Facebook Sign-In Error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<void> updateUserRole(String role) async {
    if (profile == null) {
      log(" No profile loaded, can't update role");
      return;
    }

    final updatedProfile = Profile(
      id: profile!.id,
      username: profile!.username,
      email: profile!.email,
      role: role,
      serviceId: profile!.serviceId,
      price: profile!.price,
    );

    await _profileOps.updateProfile(updatedProfile);
    profile = updatedProfile;

    log(" User role updated to $role");
  }

  Future<void> signOut() async {
    await supabaseClient.auth.signOut();
    profile = null;
    log(" Signed out from Facebook & Supabase");
  }
}
