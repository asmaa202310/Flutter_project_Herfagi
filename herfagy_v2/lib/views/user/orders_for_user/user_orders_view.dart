import 'package:flutter/material.dart';
import 'widgets/orders_view_body.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const UserOrdersViewBody(),
    );
  }
}
