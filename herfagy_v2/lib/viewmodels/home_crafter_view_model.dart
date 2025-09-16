import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/get_order_status_extension.dart';
import '../../../../models/order.dart';

class ProgressProvider extends ChangeNotifier {
  int _completedProjects = 0;
  int _inProgressProjects = 0;
  int _totalProjects = 0;

  double get progress => _totalProjects == 0
      ? 0
      : (_completedProjects + _inProgressProjects) / _totalProjects;

  int get completedProjects => _completedProjects;
  int get uncompletedProjects => _inProgressProjects;

  void updateOrders(List<Order> orders, String crafterId) {
    final crafterOrders = orders
        .where((o) => o.crafterId == crafterId)
        .toList();

    _completedProjects = crafterOrders
        .where((o) => o.status == OrderStatus.completed)
        .length;
    _inProgressProjects = crafterOrders
        .where((o) => o.status == OrderStatus.inProgress)
        .length;
    _totalProjects = crafterOrders.length;

    notifyListeners();
  }
}
