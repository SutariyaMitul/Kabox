import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/avaulable_screen/available_for_work.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';

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
