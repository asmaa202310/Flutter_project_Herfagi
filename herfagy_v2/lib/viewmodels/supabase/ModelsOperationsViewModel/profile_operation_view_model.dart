import 'package:flutter/foundation.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileOperationViewModel extends ChangeNotifier {
  final List<Profile> _profiles = [];
  List<Profile> get profiles => _profiles;

  final SupabaseClient supabaseClient = sl<SupabaseClient>();

  Future<void> loadProfiles() async {
    try {
      final result = await supabaseClient
          .from('profiles')
          .select()
          .order('id', ascending: true);

      _profiles.clear();

      for (var item in result) {
        _profiles.add(Profile.fromMap(item));
      }

      notifyListeners();
    } catch (e) {
      debugPrint("the error is $e");
      throw "$e";
    }
  }

  Future<void> addProfile(Profile profile) async {
    try {
      final result = await supabaseClient
          .from('profiles')
          .upsert(profile.toMap())
          .select()
          .maybeSingle();

      if (result == null) {
        debugPrint("Profile insert/upsert failed");
        return;
      }

      final newProfile = Profile.fromMap(result);

      _profiles.add(newProfile);
      notifyListeners();
    } catch (e) {
      debugPrint("the error is $e");
      throw "$e";
    }
  }

  Future<void> updateProfile(Profile profile) async {
    try {
      if (profile.id.isEmpty) return;

      final result = await supabaseClient
          .from('profiles')
          .update(profile.toMap())
          .eq('id', profile.id)
          .select()
          .single();

      final updateProfile = Profile.fromMap(result);
      final index = _profiles.indexWhere((p) => p.id == updateProfile.id);
      if (index != -1) {
        _profiles[index] = updateProfile;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("the error is $e");
      throw "$e";
    }
  }

  Future<void> deleteProfile(Profile profile) async {
    try {
      if (profile.id.isEmpty) return;

      await supabaseClient
          .from('profiles')
          .delete()
          .eq('id', profile.id)
          .select();
      _profiles.removeWhere((p) => p.id == profile.id);
      notifyListeners();
    } catch (e) {
      debugPrint("the error is $e");
      throw "$e";
    }
  }
}
