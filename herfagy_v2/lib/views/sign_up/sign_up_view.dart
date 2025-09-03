import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/sign_up_view_model.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SignUpViewModel(),
        child: const SignUpViewBody(),
      ),
    );
  }
}
