import 'package:flutter/foundation.dart';
import 'package:herfagy_v2/models/rating.dart';
import 'package:herfagy_v2/services/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RatingOperationViewModel extends ChangeNotifier {
  final List<Rating> _ratings = [];
  List<Rating> get ratings => _ratings;

  final SupabaseClient supabaseClient = sl<SupabaseClient>();

  Future<void> loadRatings() async {
    try {
      final result = await supabaseClient
          .from('ratings')
          .select()
          .order('rate', ascending: false);

      _ratings.clear();
      for (var item in result) {
        _ratings.add(Rating.fromMap(item));
      }
      notifyListeners();
    } catch (e) {
      debugPrint("Load Ratings error: $e");
      throw "$e";
    }
  }

  Future<void> addRating(Rating rating) async {
    try {
      final result = await supabaseClient
          .from('ratings')
          .insert(rating.toMap())
          .select()
          .maybeSingle();

      if (result == null) return;

      _ratings.add(Rating.fromMap(result));
      notifyListeners();
    } catch (e) {
      debugPrint("Add Rating error: $e");
      throw "$e";
    }
  }

  Future<void> updateRating(Rating rating) async {
    try {
      final result = await supabaseClient
          .from('ratings')
          .update(rating.toMap())
          .eq('customer_id', rating.customerId)
          .eq('crafter_id', rating.crafterId)
          .select()
          .single();

      final updatedRating = Rating.fromMap(result);
      final index = _ratings.indexWhere(
        (r) =>
            r.customerId == updatedRating.customerId &&
            r.crafterId == updatedRating.crafterId,
      );

      if (index != -1) {
        _ratings[index] = updatedRating;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Update Rating error: $e");
      throw "$e";
    }
  }

  Future<void> deleteRating(Rating rating) async {
    try {
      await supabaseClient
          .from('ratings')
          .delete()
          .eq('customer_id', rating.customerId)
          .eq('crafter_id', rating.crafterId);

      _ratings.removeWhere(
        (r) =>
            r.customerId == rating.customerId &&
            r.crafterId == rating.crafterId,
      );

      notifyListeners();
    } catch (e) {
      debugPrint("Delete Rating error: $e");
      throw "$e";
    }
  }

  Future<int?> getRatingByCustomerAndCrafter(
    String customerId,
    String crafterId,
  ) async {
    try {
      final result = await supabaseClient
          .from('ratings')
          .select('rate')
          .eq('customer_id', customerId)
          .eq('crafter_id', crafterId)
          .maybeSingle();

      if (result == null) return null;
      return result['rate'] as int;
    } catch (e) {
      debugPrint("Get Rating error: $e");
      return null;
    }
  }

  Future<int?> getHighestRatingByCrafter(String crafterId) async {
    try {
      final result = await supabaseClient
          .from('ratings')
          .select('rate')
          .eq('crafter_id', crafterId)
          .order('rate', ascending: false)
          .limit(1)
          .maybeSingle();

      if (result == null) return null;
      return result['rate'] as int;
    } catch (e) {
      debugPrint("Get Highest Rating error: $e");
      return null;
    }
  }
}
