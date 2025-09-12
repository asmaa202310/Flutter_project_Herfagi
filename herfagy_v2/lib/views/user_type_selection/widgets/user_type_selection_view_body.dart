import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import 'package:provider/provider.dart';
import '../../../utils/size_config.dart';
import '../../../viewmodels/supabase/auth_view_model.dart';
import '../../login/login_view.dart';
import '../../login/widgets/row_check_account_widget.dart';
import 'account_card.dart';
import 'logo_widget.dart';

class UserTypeSelectionViewBody extends StatelessWidget {
  const UserTypeSelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthViewModel>();
    SizeConfig.init(context);
    final localization = context.localization;

    Future<void> selectRoleAndNavigate(String role, Widget nextPage) async {
      await authVM.updateUserRole(role);
      if (!context.mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextPage),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(fraction: 0.05),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.height(fraction: 0.05)),
            const LogoWidget(),
            SizedBox(height: SizeConfig.height(fraction: 0.03)),
            Text(
              localization.chooseAccountType,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: SizeConfig.width(fraction: 0.09),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.02)),
            Text(
              localization.pleaseChooseAccountType,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: SizeConfig.width(fraction: 0.04),
                height: 1.5,
              ),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.05)),
            AccountCard(
              title: localization.crafterAccount,
              description: localization.crafterAccountDescription,
              icon: Icons.work_outline,
              bgColor: Colors.blue,
              iconColor: Colors.white,
              borderColor: Colors.blue.shade700,
              onTap: () => selectRoleAndNavigate('Crafter', const LoginView()),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.03)),
            AccountCard(
              title: localization.userAccount,
              description: localization.userAccountDescription,
              icon: Icons.person_outline,
              bgColor: Colors.white,
              iconColor: Colors.blueGrey,
              borderColor: Colors.grey.shade300,
              onTap: () => selectRoleAndNavigate('User', const LoginView()),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.06)),
            RowCheckAccountWidget(
              questionText: localization.alreadyHaveAccount,
              buttonText: localization.login,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
              ),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.03)),
          ],
        ),
      ),
    );
  }
}
