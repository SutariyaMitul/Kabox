import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
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
        Container(
          //constraints: const BoxConstraints(maxHeight: 150.0),
          height: 35,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: TabBar(
              indicator: BoxDecoration(
                color: CommonColor.blueWhiteColor,
                borderRadius: BorderRadius.circular(8)
              ),
              controller: _tabController,
              //isScrollable: true,
              dividerHeight: 00,
              labelColor: CommonColor.white,
              unselectedLabelColor: Colors.grey,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.green,
              labelStyle: TextStyles.twelveTSGrey,
              padding: EdgeInsets.zero,
              tabs: const [
                Tab(
                  text: "info",
                ),
                Tab(
                  text: "Files(3)",
                ),
                Tab(
                  text: "Checklist(1)",
                )
              ],
            ),
          ),
        ),
      ],
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CommonColor.colorBlue,
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          "assets/images/add_photo.svg",
          height: 22,
          width: 22,
        ),
      ),*/
      body: SingleChildScrollView(
        child: Container(
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
                  width: width,
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
              Container(
                width: width,
                color: Colors.white,
                margin: const EdgeInsets.only(top: 11, bottom: 11),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 19, right: 26, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonInfoItem(
                        svgPath: "assets/images/key.svg",
                        height: 18,
                        width: 18,
                        description: CommonText.key_num_desc,
                        textStyle: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CommonInfoItem(
                        svgPath: "assets/images/pass_description.svg",
                        height: 18,
                        width: 18,
                        description: CommonText.key_num_desc_detail,
                        textStyle: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        bottomMargin: 0.0,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 15, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonInfoItem(
                        svgPath: "assets/images/note.svg",
                        height: 18,
                        width: 18,
                        description: CommonText.note,
                        bottomMargin: 12,
                        textStyle: TextStyle(
                          color: Color(0xFF1A56DB),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CommonText.note_detail,
                        style: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 15, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonInfoItem(
                        svgPath: "assets/images/description_icon.svg",
                        height: 18,
                        width: 18,
                        description: CommonText.product_description,
                        textStyle: TextStyle(
                          color: Color(0xFF1A56DB),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CommonText.product_description_detail,
                        style: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 23.0, right: 15, top: 14, bottom: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonInfoItem(
                        svgPath: "assets/images/person_icon.svg",
                        height: 18,
                        width: 18,
                        description: CommonText.otherson_location,
                        textStyle: TextStyle(
                          color: Color(0xFF1A56DB),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Full name (time that they are scheduled)",
                        style: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        CommonText.phone_number,
                        style: TextStyle(
                          color: Color(0xFF1A56DB),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Full name (09:30 - 11:00)",
                        style: TextStyle(
                          color: CommonColor.darkGreyColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        CommonText.phone_number,
                        style: TextStyle(
                          color: Color(0xFF1A56DB),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              /* const SizedBox(
                height: 70,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
/*  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }*/
}
