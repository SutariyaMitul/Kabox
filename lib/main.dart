import 'package:flutter/material.dart';
import 'package:kbox/Common/common_%20datepicker.dart';
import 'package:kbox/customer_screen/singup_screen/singup_screen.dart';
import 'package:kbox/customer_screen/splash_screen/splash_screen.dart';
import 'package:kbox/customer_screen/upcoming_screen/upcoming_screen.dart';
import 'package:kbox/login_screen/Login_Screen.dart';
import 'package:kbox/employee_screen/profile_screen/profile_screen.dart';
import 'package:kbox/employee_screen/registerabsence_screen/register_absence.dart';
import 'package:kbox/employee_screen/schedule_screen/schedule_screen.dart';
import 'package:kbox/employee_screen/reimbursfortravels_screen/reimburs%20_for_travels.dart';
import 'package:kbox/employee_screen/workinfo_screen/work_info_screen.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/work_schedule_detail.dart';

import 'employee_screen/avaulable_screen/available_for_work.dart';
import 'employee_screen/home_screen/homescreen.dart';
import 'employee_screen/home_screen/main_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainActivity(),
    );
  }
}
