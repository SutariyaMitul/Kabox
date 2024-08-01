import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/home_screen/homescreen.dart';
import 'package:kbox/employee_screen/profile_screen/profile_screen.dart';
import 'package:kbox/employee_screen/schedule_screen/schedule_screen.dart';

/*
class CommonBottomBar extends StatefulWidget {
  final Widget? Body;
   const CommonBottomBar({super.key, this.Body});

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  int selectedItemIndex = 0;

  List screenList = [
     HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CommonColor.white,
          onTap: (value) {
            selectedItemIndex = value;  
            screenList[selectedItemIndex];
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
        selectedLabelStyle: TextStyles.fourteenTSGreen,
        unselectedLabelStyle:TextStyles.fourteenTSGreen,
      ),
      body: widget.Body ?? screenList[selectedItemIndex],
    );
  }
}
*/










class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkDetailScreen()),
            );
          },
          child: Text('Go to Work Detail'),
        ),
      ),
    );
  }
}

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Screen'),
      ),
      body: Center(
        child: Text('Business Screen Content'),
      ),
    );
  }
}

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Screen'),
      ),
      body: Center(
        child: Text('School Screen Content'),
      ),
    );
  }
}

class WorkDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Detail Screen'),
      ),
      body: Center(
        child: Text('Work Detail Content'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen(selectedIndex: index)),
                (route) => false,
          );
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final int selectedIndex;

  MainScreen({this.selectedIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}