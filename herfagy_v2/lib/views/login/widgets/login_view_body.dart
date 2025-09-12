import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/size_config.dart';
import '/utils/localization_extension.dart';
import '../../sign_up/sign_up_view.dart';
import '/utils/validators.dart';
import '/viewmodels/login_view_model.dart';
import '/views/login/widgets/custom_forget_button.dart';
import '/views/login/widgets/custom_login_signup_button.dart';
import '/views/login/widgets/custom_socail_buttons_container.dart';
import '/views/login/widgets/custom_text_field.dart';
import '/views/login/widgets/or_divider.dart';
import 'row_check_account_widget.dart';
import '/views/login/widgets/image_widget.dart';
import 'package:provider/provider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                        localization.welcome,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeConfig.width(fraction: 0.08),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        localization.login,
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: SizeConfig.width(fraction: 0.085),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: SizeConfig.height(fraction: 0.03)),

                      CustomTextField(
                        label: localization.emailLabel,
                        hint: localization.emailHint,
                        controller: _emailController,
                        validator: (value) => Validators.validateEmail(value),
                        prefixIcon: Icons.email_outlined,
                      ),

                      SizedBox(height: SizeConfig.height(fraction: 0.025)),

                      Consumer<LoginViewModel>(
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

                      SizedBox(height: SizeConfig.height(fraction: 0.005)),

                      const CustomForgetPasswordButton(),

                      SizedBox(height: SizeConfig.height(fraction: 0.001)),

                      CustomLoginSignUpButton(
                        text: localization.login,
                        isLogin: true,
                        isResetPassword: false,
                        email: _emailController,
                        password: _passwordController,
                      ),
                      SizedBox(height: SizeConfig.height(fraction: 0.025)),

                      const OrDivider(),

                      SizedBox(height: SizeConfig.height(fraction: 0.025)),

                      const CustomSocialButtonsContainer(),

                      SizedBox(height: SizeConfig.height(fraction: 0.025)),

                      RowCheckAccountWidget(
                        questionText: localization.dontHaveAccount,
                        buttonText: localization.signUp,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        },
                      ),
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
