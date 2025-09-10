import 'package:flutter/material.dart';

class UserTypeSelection extends StatelessWidget {
  const UserTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

   
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
          padding: EdgeInsets.all(screenWidth * 0.05),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                title,
                style: TextStyle(
                  color: iconColor,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: iconColor,
                  fontSize: screenWidth * 0.035,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'images/signinnn.webp',
                  width: screenWidth * 0.55,
                  fit: BoxFit.cover,
                  height: screenHeight * 0.18,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Choose',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: screenWidth * 0.075,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Account Type',
                style: TextStyle(
                  color: const Color.fromARGB(255, 59, 142, 205),
                  fontSize: screenWidth * 0.11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
              Text(
                'Please select your account type to continue',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: screenWidth * 0.04,
                  height: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.06),

              // Professional Account Card
              accountCard(
                title: 'Professional Account',
                description:
                    'For craftsmen, professionals, and service providers',
                icon: Icons.work_outline,
                bgColor: Colors.blue,
                iconColor: Colors.white,
                borderColor: Colors.blue,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Professional Account Selected!'),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.04),

              // Regular User Card
              accountCard(
                title: 'Regular User',
                description: 'For customers looking for services',
                icon: Icons.person_outline,
                bgColor: Colors.white,
                iconColor: Colors.blueGrey,
                borderColor: Colors.grey.shade300,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Regular User Selected!'),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
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
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
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
