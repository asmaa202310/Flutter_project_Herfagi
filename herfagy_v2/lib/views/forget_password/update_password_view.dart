import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/onboarding/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../utils/size_config.dart';
import '../../viewmodels/supabase/auth_view_model.dart';
import '../../utils/auth_handler.dart';
import 'package:herfagy_v2/views/user/user_view.dart';

import '../login/widgets/custom_text_field.dart';
import '../login/widgets/image_widget.dart';

// class UpdatePasswordView extends StatefulWidget {
//   const UpdatePasswordView({super.key});

//   @override
//   State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
// }

// class _UpdatePasswordViewState extends State<UpdatePasswordView> {
//   final _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authVm = Provider.of<AuthViewModel>(context, listen: false);

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark.copyWith(
//         statusBarColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         appBar: AppBar(title: const Text("تغيير كلمة السر")),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(
//                   labelText: "كلمة السر الجديدة",
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   AuthHandler.handleAuth(
//                     context: context,
//                     action: () =>
//                         authVm.updatePassword(_passwordController.text),
//                     onSuccessScreen: () => const UserView(),
//                   );
//                 },
//                 child: const Text("تأكيد"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final authVm = Provider.of<AuthViewModel>(context, listen: false);
    SizeConfig.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.height(fraction: 0.02)),
                const ImageWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(fraction: 0.05),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.height(fraction: 0.02)),
                      Text(
                        localization.updatePasswordTitle,
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: SizeConfig.width(fraction: 0.08),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.015)),
                      Text(
                        localization.updatePasswordDesc,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: SizeConfig.width(fraction: 0.045),
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.03)),
                      Form(
                        key: _formKey,
                        child: CustomTextField(
                          label: localization.newPasswordLabel,
                          hint: localization.newPasswordHint,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localization.passwordRequired;
                            }
                            return null;
                          },
                          prefixIcon: Icons.security,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.03)),

                      CustomElevatedButton(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            AuthHandler.handleAuth(
                              context: context,
                              action: () => authVm.updatePassword(
                                _passwordController.text,
                              ),
                              onSuccessScreen: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      localization.passwordChangedSuccess,
                                    ),
                                  ),
                                );
                                return const UserView();
                              },
                            );
                          }
                        },
                        text: localization.confirmButton,
                        fontSize: SizeConfig.width(fraction: 0.05),
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.025)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
