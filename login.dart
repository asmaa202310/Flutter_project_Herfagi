import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Login here",
                style: TextStyle(
                  fontSize: screenHeight * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Welcome back you’ve\nbeen missed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.015),
               TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.blue[800]),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Sign in Button
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                "Create new account",
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              Text(
                "Or continue with",
                style: TextStyle(
                  fontSize: screenHeight * 0.018,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(Icons.g_mobiledata, Colors.black),
                  SizedBox(width: screenWidth * 0.05),
                  socialButton(Icons.facebook, Colors.blue),
                  SizedBox(width: screenWidth * 0.05),
                  socialButton(Icons.apple, Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 32, color: color),
    );
  }
}
