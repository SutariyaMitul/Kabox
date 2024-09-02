import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/checklist_screen.dart';
import 'package:kbox/login_screen/Login_Screen.dart';

import 'employee_screen/workscheduldetail_screen/files_screen.dart';
import 'employee_screen/workscheduldetail_screen/work_schedule_detail.dart';
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
