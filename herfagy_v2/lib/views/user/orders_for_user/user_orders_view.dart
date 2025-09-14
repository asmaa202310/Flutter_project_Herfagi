import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/orders_view_body.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrderOperationViewModel()..loadOrders(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const UserOrdersViewBody(),
      ),
    );
  }
}
