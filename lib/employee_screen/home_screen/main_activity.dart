import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/profile_screen/profile_screen.dart';
import 'package:kbox/employee_screen/schedule_screen/schedule_screen.dart';

import '../../Common/common_color.dart';
import 'homescreen.dart';

class MainActivity extends StatefulWidget {
  MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int selectedItemIndex = 0;
  List screenList = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedItemIndex = value;
          setState(() {});
        },
        currentIndex: selectedItemIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 20,
              height: 20,
              color: selectedItemIndex == 0
                  ? const Color(0xff1A56AD)
                  : CommonColor.grayColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/calendar_icon.png',
              width: 20,
              height: 20,
              color: selectedItemIndex == 1
                  ? const Color(0xff1A56AD)
                  : CommonColor.grayColor,
            ),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile_icon.png',
              width: 20,
              height: 20,
              color: selectedItemIndex == 2
                  ? const Color(0xff1A56AD)
                  : CommonColor.grayColor,
            ),
            label: "Profile",
          )
        ],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: CommonColor.blueColor,
        unselectedItemColor: CommonColor.grayColor,
      ),
      body: screenList[selectedItemIndex],
    );
  }
}
