import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'package:kbox/employee_screen/viewdirections_screen/viewdirection_screen.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/checklist_screen.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/files_screen.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/info_screen.dart';
import '../../Common/common_appbar.dart';
import '../../Common/common_button.dart';
import '../../Common/common_color.dart';
import '../../Common/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_info_item.dart';
import 'package:kbox/Common/common_text.dart';

class WorkScheduleDetail extends StatefulWidget {
  const WorkScheduleDetail({super.key});

  @override
  State<WorkScheduleDetail> createState() => _WorkScheduleDetailState();
}

class _WorkScheduleDetailState extends State<WorkScheduleDetail>
    with SingleTickerProviderStateMixin {
  bool clockStatus = false;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  int screenPos = 0;

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
      _startTimer();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
      _timer?.cancel();
      _stopwatch.reset();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  String _formattedTime() {
    final duration = _stopwatch.elapsed;
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  late TabController _tabController;

  @override
  void initState() {
    screenPos = 0;
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CommonAppbar(
      title: 'Back',
      centerTitle: false,
      bottomNavigationBar: CommonBottomBar(
        onTap: (int index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => MainActivity(selectedIndex: index)),
            (route) => false,
          );
        },
      ),
      actions: [
        SizedBox(
          width: width*0.7,
          child: Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Container(
              //constraints: const BoxConstraints(maxHeight: 150.0),
              alignment: Alignment.centerRight,
              height: 35,
              decoration: BoxDecoration(
                color: CommonColor.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: CommonColor.blueWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  controller: _tabController,
                  dividerHeight: 00,
                  labelColor: CommonColor.white,
                  unselectedLabelColor: CommonColor.darkGreyColor,
                  labelStyle: TextStyles.twelveTSGrey,
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.all(6),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 43,
                        width: 70,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text("info"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 43,
                        width: 70,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text("Files(3)"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 43,
                        width: 110,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text("Checklist (1)"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: const [
          InfoScreen(),
          FilesScreen(),
          ChecklistScreen()
        ],
      )
    );
  }
/*  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }*/
}
