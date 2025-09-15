import 'package:flutter/foundation.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceOperationViewModel extends ChangeNotifier {
  final List<Service> _services = [];
  List<Service> get services => _services;

  final SupabaseClient supabaseClient = sl<SupabaseClient>();

  Future<void> loadServices() async {
    try {
      final result = await supabaseClient.from('services').select();
      _services.clear();
      for (var item in result) {
        _services.add(Service.fromMap(item));
      }
      notifyListeners();
    } catch (e) {
      debugPrint("Load Services error: $e");
      throw "$e";
    }
  }

  Future<void> addService(Service service) async {
    try {
      final result = await supabaseClient
          .from('services')
          .insert(service.toMap())
          .select()
          .maybeSingle();

      if (result != null) {
        _services.add(Service.fromMap(result));
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Add Service error: $e");
      throw "$e";
    }
  }

  Future<void> updateService(Service service) async {
    try {
      await supabaseClient
          .from('services')
          .update(service.toMap())
          .eq('id', service.id);

      final index = _services.indexWhere((s) => s.id == service.id);
      if (index != -1) {
        _services[index] = service;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Update Service error: $e");
      throw "$e";
    }
  }

  Future<void> deleteService(Service service) async {
    try {
      await supabaseClient.from('services').delete().eq('id', service.id);

      _services.removeWhere((s) => s.id == service.id);
      notifyListeners();
    } catch (e) {
      debugPrint("Delete Service error: $e");
      throw "$e";
    }
  }

  Future<Service?> getServiceById(int id) async {
    try {
      final result = await supabaseClient
          .from('services')
          .select()
          .eq('id', id)
          .maybeSingle();

      if (result == null) return null;

      return Service.fromMap(result);
    } catch (e) {
      debugPrint("Get Service by ID error: $e");
      return null;
    }
  }
}
