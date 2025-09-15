import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import '../../../viewmodels/home_crafter_view_model.dart'; // فيه ProgressProvider
import 'widgets/home_crafter_view_body.dart';

class HomeCrafterView extends StatelessWidget {
  const HomeCrafterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProgressProvider()),
          ChangeNotifierProvider(
            create: (_) => OrderOperationViewModel()..loadOrders(),
          ),
        ],
        child: const HomeCrafterViewBody(),
      ),
    );
  }
}
