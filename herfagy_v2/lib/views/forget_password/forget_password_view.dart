import 'package:flutter/material.dart';
import 'package:herfagy_v2/constants/app_colors.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/theme_view_model.dart';
import '/utils/localization_extension.dart';
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
    final localization = context.localization;
    final themeProvider = context.read<ThemeViewModel>();
    SizeConfig.init(context);
    return SafeArea(
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
                      localization.forgetPasswordTitle,
                      style: TextStyle(
                        color: AppColors.kPrimaryColorLight.shade700,
                        fontSize: SizeConfig.width(fraction: 0.08),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height(fraction: 0.015)),
                    Text(
                      localization.forgetPasswordDesc,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: themeProvider.isDarkMode
                            ? Colors.grey
                            : Colors.blueGrey,
                        fontSize: SizeConfig.width(fraction: 0.045),
                      ),
                      // style: TextStyle(
                      //   color: Colors.blueGrey,
                      //   fontSize: SizeConfig.width(fraction: 0.045),
                      // ),
                    ),
                    SizedBox(height: SizeConfig.height(fraction: 0.03)),

                    CustomTextField(
                      label: localization.emailLabel,
                      hint: localization.emailHint,
                      controller: _emailController,
                      validator: (value) => Validators.validateEmail(value),
                      prefixIcon: Icons.email_outlined,
                    ),

                    SizedBox(height: SizeConfig.height(fraction: 0.03)),
                    CustomLoginSignUpButton(
                      text: localization.sendResetLinkButton,
                      isLogin: false,
                      isResetPassword: true,
                      email: _emailController,
                    ),
                    SizedBox(height: SizeConfig.height(fraction: 0.025)),
                    RowCheckAccountWidget(
                      questionText: localization.rememberPassword,
                      buttonText: localization.login,
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
