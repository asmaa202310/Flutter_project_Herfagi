import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/crafter_order_view_body.dart';

class CrafterOrdersView extends StatelessWidget {
  const CrafterOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrderOperationViewModel()..loadOrders(),
      child: Scaffold(body: const CrafterOrdersViewBody()),
    );
  }
}
