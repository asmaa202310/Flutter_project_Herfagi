import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_config.dart';
import '../../../utils/validators.dart';
import '../../../viewmodels/sign_up_view_model.dart';
import '../../login/widgets/custom_login_signup_button.dart';
import '../../login/widgets/custom_socail_buttons_container.dart';
import '../../login/widgets/custom_text_field.dart';
import '../../login/widgets/image_widget.dart';
import '../../login/widgets/or_divider.dart';
import '../../login/widgets/row_check_account_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final localization = context.localization;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                        localization.signUpTitle,
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: SizeConfig.width(fraction: 0.085),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.03)),

                      CustomTextField(
                        label: localization.nameLabel,
                        hint: localization.nameHint,
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localization.nameRequired;
                          }
                          return null;
                        },
                        prefixIcon: Icons.person_outline,
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      CustomTextField(
                        label: localization.emailLabel,
                        hint: localization.emailHint,
                        controller: _emailController,
                        validator: (value) => Validators.validateEmail(value),
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      Consumer<SignUpViewModel>(
                        builder: (context, viewModel, _) {
                          return CustomTextField(
                            obscureText: viewModel.obscurePassword,
                            label: localization.passwordLabel,
                            hint: localization.passwordHint,
                            controller: _passwordController,
                            validator: (value) =>
                                Validators.validatePassword(value),
                            prefixIcon: Icons.security,
                            onSuffixIconPressed:
                                viewModel.togglePasswordVisibility,
                            suffixIcon: viewModel.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          );
                        },
                      ),

                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      Consumer<SignUpViewModel>(
                        builder: (context, viewModel, _) {
                          return CustomTextField(
                            obscureText: viewModel.obscureConfirmPassword,
                            label: localization.confirmPasswordLabel,
                            hint: localization.confirmPasswordHint,
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return localization.passwordsDoNotMatch;
                              }
                              return null;
                            },
                            prefixIcon: Icons.security,
                            onSuffixIconPressed:
                                viewModel.toggleConfirmPasswordVisibility,
                            suffixIcon: viewModel.obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          );
                        },
                      ),

                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      CustomLoginSignUpButton(
                        text: localization.createAccountButton,
                        isLogin: false,
                        isResetPassword: false,
                        username: _nameController,
                        password: _passwordController,
                        email: _emailController,
                      ),

                      SizedBox(height: SizeConfig.height(fraction: 0.02)),
                      const OrDivider(),
                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      const CustomSocialButtonsContainer(),

                      SizedBox(height: SizeConfig.height(fraction: 0.02)),

                      RowCheckAccountWidget(
                        questionText: localization.alreadyHaveAccount,
                        buttonText: localization.login,
                        onTap: () => Navigator.pop(context),
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
