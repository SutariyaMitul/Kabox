import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/avaulable_screen/available_for_work.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'customer_screen/singup_screen/singup_screen.dart';
import 'demo/mainscreen.dart';
import 'employee_screen/choosepassword_screen/checkemail_screen.dart';
import 'employee_screen/choosepassword_screen/choosepasword_screen.dart';
import 'employee_screen/choosepassword_screen/forget_screen.dart';
import 'login_screen/Login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvailableForWork(),
    );
  }
}
