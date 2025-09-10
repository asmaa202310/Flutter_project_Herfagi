import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrdersForUserViewModel extends ChangeNotifier {
  final List<OrderModel> _orders = [
    OrderModel(
      service: "سباكة",
      person: "أحمد علي",
      date: "1/9/2025",
      status: "قيد التنفيذ",
      details: 'this is the details',
    ),
    OrderModel(
      service: "كهرباء",
      person: "محمد حسن",
      date: "25/8/2025",
      status: "مكتمل",
      details: 'this is the details',
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
      details: 'this is the details',
    ),
    OrderModel(
      service: "دهان",
      person: "علي إبراهيم",
      date: "15/8/2025",
      status: "مرفوض",
      details: 'this is the details',
    ),
    OrderModel(
      service: "تكييف وتبريد",
      person: "خالد يوسف",
      date: "10/8/2025",
      status: "جديد",
      details: 'this is the details',
    ),
  ];
  List<OrderModel> get ordersList => _orders;

  void addOrder(OrderModel newOrder) {
    _orders.insert(0, newOrder);
    notifyListeners();
  }
}
