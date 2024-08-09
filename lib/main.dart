import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/profile_screen/profile_screen.dart';
import 'package:kbox/login_screen/Login_Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
