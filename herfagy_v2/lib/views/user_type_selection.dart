import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:herfagy_v2/views/crafter/crafter_view.dart';
import 'package:herfagy_v2/views/user/user_view.dart';

class UserTypeSelection extends StatelessWidget {
  const UserTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final authVM = Provider.of<AuthViewModel>(context);

    Widget accountCard({
      required String title,
      required String description,
      required IconData icon,
      required Color bgColor,
      required Color iconColor,
      required Color borderColor,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.025,
            horizontal: screenWidth * 0.05,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: borderColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: iconColor, size: screenWidth * 0.08),
              ),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: iconColor,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    Text(
                      description,
                      style: TextStyle(
                        color: iconColor,
                        fontSize: screenWidth * 0.035,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Future<void> selectRoleAndNavigate(String role, Widget nextPage) async {
      await authVM.updateUserRole(role);

      if (!context.mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextPage),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),

              Center(
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/EiOMD.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Text(
                'اختر نوع الحساب',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'يرجى اختيار نوع الحساب للمتابعة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: screenWidth * 0.04,
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // حساب الحرفي / المتخصص
              accountCard(
                title: 'حرفي / متخصص',
                description: 'للحرفيين والمتخصصين ومقدمي الخدمات',
                icon: Icons.work_outline,
                bgColor: Colors.blue.shade600,
                iconColor: Colors.white,
                borderColor: Colors.blue.shade700,
                onTap: () => selectRoleAndNavigate('Crafter', const CrafterView()),
              ),

              SizedBox(height: screenHeight * 0.03),

              // حساب المستخدم العادي / الزبون
              accountCard(
                title: 'مستخدم عادي / زبون',
                description: 'للعملاء الذين يبحثون عن الخدمات',
                icon: Icons.person_outline,
                bgColor: Colors.white,
                iconColor: Colors.blueGrey,
                borderColor: Colors.grey.shade300,
                onTap: () => selectRoleAndNavigate('User', const UserView()),
              ),

              SizedBox(height: screenHeight * 0.06),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "هل لديك حساب بالفعل؟ ",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
