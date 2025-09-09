import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseClient _client = Supabase.instance.client;

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;

  String? get userId => _client.auth.currentUser?.id;

  Future<String?> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client.auth.signUp(email: email, password: password);

      final newUser = res.user;
      if (newUser == null) return "User creation failed";

      final data = {'id': newUser.id, 'username': username, 'email': email};

      final insert = await _client
          .from('users')
          .insert(data)
          .select()
          .maybeSingle();

      if (insert == null) return "Failed to insert user data";
      _userData = insert;
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user == null) return "Login failed";

      await fetchUserData();
      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
    _userData = null;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> fetchUserData() async {
    if (userId == null) return null;

    final res = await _client
        .from('users')
        .select()
        .eq('id', userId!)
        .maybeSingle();
    _userData = res;
    notifyListeners();
    return _userData;
  }
}
