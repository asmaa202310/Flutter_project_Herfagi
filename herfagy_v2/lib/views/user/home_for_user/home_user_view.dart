import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/home_user_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/home_user_view_body.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => HomeUserViewModel(),
        child: const HomeUserViewBody(),
      ),
    );
  }
}
