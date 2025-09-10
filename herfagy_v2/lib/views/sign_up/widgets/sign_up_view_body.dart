import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: screenWidth * 0.085,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    CustomTextField(
                      label: "الاسم",
                      hint: "ادخل الاسم بالكامل",
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                      prefixIcon: Icons.person_outline,
                    ),
                    SizedBox(height: screenHeight * 0.025),

                    CustomTextField(
                      label: "البريد الالكترونى",
                      hint: "ادخل البريد الالكترونى",
                      controller: _emailController,
                      validator: (value) => Validators.validateEmail(value),
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: screenHeight * 0.025),

                    Consumer<SignUpViewModel>(
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

                    SizedBox(height: screenHeight * 0.025),

                    Consumer<SignUpViewModel>(
                      builder: (context, viewModel, _) {
                        return CustomTextField(
                          obscureText: viewModel.obscureConfirmPassword,
                          label: "تأكيد كلمة السر",
                          hint: "اعد كتابة كلمة السر",
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return "Passwords do not match";
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

                    SizedBox(height: screenHeight * 0.03),

                    CustomLoginSignUpButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: "إنشاء حساب",
                      isLogin: false,
                      isResetPassword: false,
                      username: _nameController.text,
                      password: _passwordController.text,
                      email: _emailController.text,
                    ),

                    SizedBox(height: screenHeight * 0.025),
                    const OrDivider(),
                    SizedBox(height: screenHeight * 0.025),

                    const CustomSocialButtonsContainer(),

                    SizedBox(height: screenHeight * 0.025),

                    RowCheckAccountWidget(
                      questionText: "هل لديك حساب بالفعل؟",
                      buttonText: "  تسجيل الدخول",
                      onTap: () => Navigator.pop(context),
                    ),
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
