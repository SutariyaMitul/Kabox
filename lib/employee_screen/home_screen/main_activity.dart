import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/profile_screen/profile_screen.dart';
import 'package:kbox/employee_screen/schedule_screen/schedule_screen.dart';
import 'homescreen.dart';

class MainActivity extends StatefulWidget {
  MainActivity({super.key, this.body, this.selectedIndex = 0, this.onTap});

  final int? selectedIndex;
  final Widget? body;
  final ValueChanged<int>? onTap;

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.selectedIndex!;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: CommonColor.white,
        //currentIndex: selectedItemIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
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
          ),
        ],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: CommonColor.blueColor,
        unselectedItemColor: CommonColor.grayColor,
        selectedLabelStyle: TextStyles.fourteenTSGreen,
        unselectedLabelStyle: TextStyles.fourteenTSGreen,
        currentIndex: selectedItemIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[selectedItemIndex],
    );
  }
}

class CommonBottomBar extends StatefulWidget {
  const CommonBottomBar({super.key, this.onTap, this.selectedIndex = 0});

  final ValueChanged<int>? onTap;
  final int? selectedIndex;

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  int selectedItemIndex = 0;


  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.selectedIndex!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: BottomNavigationBar(
        backgroundColor: CommonColor.white,
          items: <BottomNavigationBarItem>[
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
            ),
          ],
          currentIndex: 0,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: CommonColor.blueColor,
          unselectedItemColor: CommonColor.grayColor,
          selectedLabelStyle: TextStyles.fourteenTSGreen,
          unselectedLabelStyle: TextStyles.fourteenTSGreen,
          onTap: widget.onTap
          /*(int index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => MainActivity(selectedIndex: index)),
                (route) => false,
          );
        },*/
          ),
    );
  }
}
