import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        ],
        child: const HomeCrafterViewBody(),
      ),
    );
  }
}
