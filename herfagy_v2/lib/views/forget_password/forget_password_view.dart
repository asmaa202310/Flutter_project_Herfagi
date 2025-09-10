import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/forget_password_view_model.dart';
import '../login/widgets/row_check_account_widget.dart';
import '/utils/validators.dart';
import '/views/login/widgets/custom_text_field.dart';
import '/views/login/widgets/custom_login_signup_button.dart';
import '/views/login/widgets/image_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ForgetPasswordViewModel(),
        child: const ForgetPasswordViewBody(),
      ),
    );
  }
}

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                      'هل نسيت كلمة السر؟',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'من فضلك أدخل بريدك الإلكتروني وسنرسل لك رابط لإعادة تعيين كلمة السر.',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomTextField(
                      label: "البريد الإلكتروني",
                      hint: "ادخل بريدك الإلكتروني",
                      controller: _emailController,
                      validator: (value) => Validators.validateEmail(value),
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomLoginSignUpButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: "إرسال الرابط",
                      isLogin: false,
                      isResetPassword: true,
                      email: _emailController.text,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    RowCheckAccountWidget(
                      questionText: "تذكرت كلمة المرور؟",
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
