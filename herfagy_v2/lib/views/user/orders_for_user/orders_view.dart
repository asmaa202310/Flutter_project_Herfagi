import 'package:flutter/material.dart';
import '../../../models/old/order_model.dart';
import 'widgets/custom_orders_app_bar.dart';
import 'widgets/orders_sliver_list_builder.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  final List<OrderModel> orders = const [
    OrderModel(
      service: "سباكة",
      person: "أحمد علي",
      date: "1/9/2025",
      status: "قيد التنفيذ",
    ),
    OrderModel(
      service: "كهرباء",
      person: "محمد حسن",
      date: "25/8/2025",
      status: "مكتمل",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
    OrderModel(
      service: "نجارة",
      person: "كريم محمود",
      date: "20/8/2025",
      status: "جديد",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const CustomOrdersAppBar(text: "الحجوزات"),
          OrdersSliverListBuilder(orders: orders),
        ],
      ),
    );
  }
}
