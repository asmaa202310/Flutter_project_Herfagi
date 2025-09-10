import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/orders_for_crafter_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/order_crafter_view_body.dart';

class OrdersCrafterView extends StatelessWidget {
  const OrdersCrafterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrdersForCrafterViewModel(),
      child: Scaffold(body: const OrdersCrafterViewBody()),
    );
  }
}
