import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseClient _client = Supabase.instance.client;

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

      final data = {
        'id': newUser.id,
        'username': username,
        'email': email,
        'role': role,
      };

      final insert = await _client
          .from('profiles')
          .insert(data)
          .select()
          .maybeSingle();

      if (insert == null) return "Failed to insert user data";

      _profile = Profile.fromMap(insert);
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
  }

  Future<Profile?> fetchUserData() async {
    if (userId == null) return null;

    _setLoading(true);
    try {
      final res = await _client
          .from('profiles')
          .select()
          .eq('id', userId!)
          .maybeSingle();

      if (res != null) {
        _profile = Profile.fromMap(res);
        notifyListeners();
      }
      return _profile;
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
}
