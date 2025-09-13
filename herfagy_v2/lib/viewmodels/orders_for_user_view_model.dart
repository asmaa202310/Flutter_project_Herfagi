import 'package:flutter/material.dart';
import '../models/old/order_model.dart';
import '../utils/get_localize_title.dart';
import '../utils/get_order_status_extension.dart';

class OrdersForUserViewModel extends ChangeNotifier {
  final List<OrderModel> _orders = [
    OrderModel(
      service: ServiceKey.plumber,
      person: "أحمد علي",
      date: "1/9/2025",
      status: OrderStatus.inProgress,
      details: 'إصلاح تسريب في حوض المطبخ.',
    ),
    OrderModel(
      service: ServiceKey.electrician,
      person: "سارة محمد",
      date: "25/8/2025",
      status: OrderStatus.completed,
      details: 'تركيب 5 لمبات LED جديدة في غرفة المعيشة.',
    ),
    OrderModel(
      service: ServiceKey.carpenter,
      person: "كريم محمود",
      date: "20/8/2025",
      status: OrderStatus.newOrder,
      details: 'تصنيع وتركيب رفوف خشبية.',
    ),
    OrderModel(
      service: ServiceKey.painter,
      person: "علي إبراهيم",
      date: "15/8/2025",
      status: OrderStatus.rejected,
      details: 'دهان حائط غرفة النوم باللون الأزرق.',
    ),
  ];

  List<OrderModel> get ordersList => _orders;

  void addOrder(OrderModel newOrder) {
    _orders.insert(0, newOrder);
    notifyListeners();
  }
}
