import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/orders_for_user_view_model.dart';
import 'widgets/orders_view_body.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrdersForUserViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const UserOrdersViewBody(),
      ),
    );
  }
}
