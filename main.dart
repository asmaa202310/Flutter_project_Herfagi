import 'package:flutter/material.dart';

import 'choose.dart';
import 'login.dart';
import 'signup.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateAccountScreen(), // 
    );
  }
}