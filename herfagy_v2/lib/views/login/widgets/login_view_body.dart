import 'package:flutter/material.dart';
import '/utils/validators.dart';
import '/viewmodels/login_view_model.dart';
import '/views/login/widgets/custom_forget_button.dart';
import '/views/login/widgets/custom_login_signup_button.dart';
import '/views/login/widgets/custom_socail_buttons_container.dart';
import '/views/login/widgets/custom_text_field.dart';
import '/views/login/widgets/or_divider.dart';
import '/views/login/widgets/signup_new_account_widget.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageWidget(screenWidth: screenWidth),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'مرحبا!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: screenWidth * 0.085,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomTextField(
                      label: "البريد الالكترونى",
                      hint: "ادخل البريد الالكترونى",
                      controller: _emailController,
                      validator: (value) => Validators.validateEmail(value),
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Consumer<LoginViewModel>(
                      builder: (context, viewModel, _) {
                        return CustomTextField(
                          obscureText: viewModel.obscurePassword,
                          label: "كلمة السر",
                          hint: "ادخل كلمة السر",
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
                    SizedBox(height: screenHeight * 0.005),
                    const CustomForgetPasswordButton(),
                    SizedBox(height: screenHeight * 0.001),
                    CustomLoginSignUpButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: "تسجيل الدخول",
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    const OrDivider(),
                    SizedBox(height: screenHeight * 0.025),
                    const CustomSocialButtonsContainer(),
                    SizedBox(height: screenHeight * 0.025),
                    const SignUpNewAccountWidget(),
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
