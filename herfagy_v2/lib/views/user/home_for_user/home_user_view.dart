import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/rating_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/home_user_view_body.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileOperationViewModel()..loadProfiles()),
          ChangeNotifierProvider(create: (_) => ServiceOperationViewModel()..loadServices()),
          ChangeNotifierProvider(create: (_) => RatingOperationViewModel()..loadRatings()),
        ],
        child: const HomeUserViewBody(),
      ),
    );
  }
}
