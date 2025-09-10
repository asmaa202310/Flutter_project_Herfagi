import 'package:flutter/material.dart';
import '../models/old/order_model.dart'; 
class OrdersForCrafterViewModel extends ChangeNotifier {
  final List<OrderModel> _orders = [
    OrderModel(
      service: "سباكة",
      person: "أحمد علي", 
      date: "1/9/2025",
      status: "قيد التنفيذ",
      details: 'إصلاح تسريب في حوض المطبخ.',
    ),
    OrderModel(
      service: "كهرباء",
      person: "سارة محمد",
      date: "25/8/2025",
      status: "مكتمل",
      details: 'تركيب 5 لمبات LED جديدة في غرفة المعيشة.',
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
      details: 'تصنيع وتركيب رفوف خشبية.',
    ),
    OrderModel(
      service: "دهان",
      person: "علي إبراهيم",
      date: "15/8/2025",
      status: "مرفوض",
      details: 'دهان حائط غرفة النوم باللون الأزرق.',
    ),
  ];

  List<OrderModel> get ordersList => _orders;

  void addOrder(OrderModel newOrder) {
    _orders.insert(0, newOrder);
    notifyListeners();
  }
}
