import 'package:flutter/material.dart';
import 'package:herfagy_v2/constants/app_colors.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/views/onboarding/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../utils/size_config.dart';
import '../../viewmodels/supabase/auth_view_model.dart';
import '../../utils/auth_handler.dart';
import 'package:herfagy_v2/views/user/user_view.dart';
import '../../viewmodels/theme_view_model.dart';
import '../login/widgets/custom_text_field.dart';
import '../login/widgets/image_widget.dart';

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
    final themeProvider = context.read<ThemeViewModel>();
    SizeConfig.init(context);

    return Scaffold(
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
                        color: AppColors.kPrimaryColorLight.shade700,
                        fontSize: SizeConfig.width(fraction: 0.08),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height(fraction: 0.015)),
                    Text(
                      localization.updatePasswordDesc,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: themeProvider.isDarkMode
                            ? Colors.grey
                            : Colors.blueGrey,
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
                            action: () =>
                                authVm.updatePassword(_passwordController.text),
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
    );
  }
}
