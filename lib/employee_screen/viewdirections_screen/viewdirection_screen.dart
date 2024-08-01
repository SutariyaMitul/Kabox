import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_appbar.dart';
import 'package:kbox/Common/common_button.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';

class ViewDirectionScreen extends StatefulWidget {
  const ViewDirectionScreen({super.key});

  @override
  State<ViewDirectionScreen> createState() => _ViewDirectionScreenState();
}

class _ViewDirectionScreenState extends State<ViewDirectionScreen>  with SingleTickerProviderStateMixin {

  bool clockStatus = false;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

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

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }
  String _formattedTime() {
    final duration = _stopwatch.elapsed;
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: 'Back',
      centerTitle: false,
      bottomNavigationBar: CommonBottomBar(
        onTap: (int index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MainActivity(selectedIndex: index),
            ),
            (route) => false,
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Container(
            //constraints: const BoxConstraints(maxHeight: 150.0),
            alignment: Alignment.centerRight,
            height: 35,
            width: 250,
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
      ],
      body: Container(
        color: CommonColor.lightGreyColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 31.0, left: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CommonButton(
                        onPress: _startStopwatch,
                        //_stopwatch.isRunning ? null : _startStopwatch,
                        title: CommonText.checkin,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CommonButton(
                        onPress:
                        //_resetStopwatch,
                        _stopwatch.isRunning ? _stopStopwatch : null,
                        title: CommonText.markcompleted,
                        color: CommonColor.greenColor,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        Text(
                          CommonText.workingtime,
                          style: TextStyle(
                            color: CommonColor.grayColor,
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _formattedTime(),
                          style: TextStyles.twentyBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: CommonColor.lightgreenColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CommonColor.greenColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              CommonText.tagofservice,
                              style: TextStyles.twelveTSDarkLightGreenColor,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DATE",
                                  style: TextStyles.fourteenTSBlueSemiBoldSix,
                                ),
                                Text(
                                  "Mon, Sep 18, 2023",
                                  style:
                                  TextStyles.sixteenTSDarkGrayRegularFour,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 39),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TIME",
                                    style:
                                    TextStyles.fourteenTSBlueSemiBoldSix,
                                  ),
                                  Text(
                                    "09:00 - 12:00",
                                    style: TextStyles
                                        .sixteenTSDarkGrayRegularFour,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0),
                        child: Row(
                          //mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5.0),
                                child: Divider(
                                  color: CommonColor.greenGrayColor,
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: CommonColor.lightGreyColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text(
                                  CommonText.notcompleted,
                                  style: TextStyles.twelveTSGrey,
                                )),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 5.0, right: 10.0),
                                child: Divider(
                                  color: CommonColor.greenGrayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          CommonText.customer,
                          style: TextStyles.fourteenTSBlueSemiBoldSix,
                        ),
                      ),
                      Text(
                        "John Smith",
                        style: TextStyles.sixteenTSDarkGrayRegularFour,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Huskvarnavägen 62",
                                  style:
                                  TextStyles.sixteenTSDarkGrayRegularFour,
                                ),
                                Text(
                                  "554 54 Jönköping",
                                  style: TextStyles.sixteenTGrey,
                                ),
                              ],
                            ),
                            //const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    CommonText.viewdirection,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.blueWhiteColor,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.normal),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/arrow_right.svg",
                                    width: 10,
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
