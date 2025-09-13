import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:herfagy_v2/viewmodels/supabase/modelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseClient _client = sl<SupabaseClient>();
  final ProfileOperationViewModel _profileOps = sl<ProfileOperationViewModel>();

  Profile? _profile;
  Profile? get profile => _profile;

  String? get userId => _client.auth.currentUser?.id;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> signUp({
    required String username,
    required String email,
    required String password,
    String? role,
  }) async {
    _setLoading(true);
    try {
      final res = await _client.auth.signUp(email: email, password: password);

      final newUser = res.user;
      if (newUser == null) return "User creation failed";

      final profileData = Profile(
        id: newUser.id,
        email: email,
        username: username,
        role: role,
      );

      await _profileOps.addProfile(profileData);

      _profile = profileData;
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      final res = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user == null) return "Login failed";

      await fetchUserData();
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
    _profile = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('handled_reset_link');
  }

  Future<void> fetchUserData() async {
    if (userId == null) return;

    _setLoading(true);
    try {
      await _profileOps.loadProfiles();

      _profile = _profileOps.profiles.firstWhere(
        (p) => p.id == userId,
        orElse: () => Profile(id: '', username: '', email: ''),
      );

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> resetPassword(String email) async {
    _setLoading(true);
    try {
      await _client.auth.resetPasswordForEmail(
        email,
        redirectTo: "herfagy://reset-callback",
      );

      return null;
    } catch (e) {
      debugPrint('$e');
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> updatePassword(String newPassword) async {
    _setLoading(true);
    try {
      final res = await _client.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      return res.user == null ? "Failed to update password" : null;
    } catch (e) {
      return e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateUserRole(String role) async {
    if (_profile == null) return;

    _profile = Profile(
      id: _profile!.id,
      username: _profile!.username,
      role: role,
      serviceId: _profile!.serviceId,
      price: _profile!.price,
      email: _profile!.email,
    );

    await _profileOps.updateProfile(_profile!);
    notifyListeners();
  }

  Future<void> deleteUser() async {
    if (_profile == null) return;

    await _profileOps.deleteProfile(_profile!);
    _profile = null;
    notifyListeners();
  }
}
