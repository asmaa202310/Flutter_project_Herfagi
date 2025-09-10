import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/supabase/auth_view_model.dart';
import '../../utils/auth_handler.dart';
import 'package:herfagy_v2/views/user/user_view.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("تغيير كلمة السر")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "كلمة السر الجديدة"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthHandler.handleAuth(
                  context: context,
                  action: () => authVm.updatePassword(_passwordController.text),
                  onSuccessScreen: () => const UserView(),
                );
              },
              child: const Text("تأكيد"),
            ),
          ],
        ),
      ),
    );
  }
}
