import 'package:flutter/material.dart';
import '/views/login/widgets/login_view_body.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: const LoginViewBody(),
      ),
    );
  }
}
