import 'package:flutter/foundation.dart';
import 'package:herfagy_v2/models/order.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/services/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderOperationViewModel extends ChangeNotifier {
  final List<Order> _orders = [];
  List<Order> get orders => (_orders);

  final SupabaseClient _supabaseClient = sl<SupabaseClient>();

  Future<void> loadOrders() async {
    try {
      final result = await _supabaseClient
          .from('orders')
          .select()
          .order('date', ascending: true);

      _orders.clear();
      for (var item in result) {
        _orders.add(Order.fromMap(item));
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Load Orders error: $e");
      rethrow;
    }
  }

  List<Order> getOrdersForUser(String userId) {
    return _orders
        .where((order) => order.customerId == userId)
        .toList(growable: false);
  }

  List<Order> getOrdersForCrafter(String crafterId) {
    return _orders
        .where((order) => order.crafterId == crafterId)
        .toList(growable: false);
  }

  Future<void> addOrder(Order order) async {
    try {
      final result = await _supabaseClient
          .from('orders')
          .insert(order.toMap())
          .select()
          .maybeSingle();

      if (result != null) {
        _orders.add(Order.fromMap(result));
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Add Order error: $e");
      rethrow;
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      final result = await _supabaseClient
          .from('orders')
          .update(order.toMap())
          .eq('service_id', order.serviceId)
          .eq('customer_id', order.customerId)
          .eq('crafter_id', order.crafterId)
          .select()
          .maybeSingle();

      if (result != null) {
        final updatedOrder = Order.fromMap(result);
        final index = _orders.indexWhere(
          (o) =>
              o.serviceId == updatedOrder.serviceId &&
              o.customerId == updatedOrder.customerId &&
              o.crafterId == updatedOrder.crafterId,
        );

        if (index != -1) {
          _orders[index] = updatedOrder;
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint("Update Order error: $e");
      rethrow;
    }
  }

  Future<void> deleteOrder(Order order) async {
    try {
      await _supabaseClient
          .from('orders')
          .delete()
          .eq('service_id', order.serviceId)
          .eq('customer_id', order.customerId)
          .eq('crafter_id', order.crafterId);

      _orders.removeWhere(
        (o) =>
            o.serviceId == order.serviceId &&
            o.customerId == order.customerId &&
            o.crafterId == order.crafterId,
      );

      notifyListeners();
    } catch (e) {
      debugPrint("Delete Order error: $e");
      rethrow;
    }
  }

  Order? getOrder(String customerId, String crafterId, int serviceId) {
    try {
      return _orders.firstWhere(
        (o) =>
            o.customerId == customerId &&
            o.crafterId == crafterId &&
            o.serviceId == serviceId,
      );
    } catch (_) {
      return null;
    }
  }

  Future<Service> getServiceForOrder(Order order) async {
    final response = await _supabaseClient
        .from('services')
        .select()
        .eq('id', order.serviceId)
        .single();
    return Service.fromMap(response);
  }

  Future<Profile> getProfile(String profileId) async {
    final response = await _supabaseClient
        .from('profiles')
        .select()
        .eq('id', profileId)
        .single();
    return Profile.fromMap(response);
  }
}
