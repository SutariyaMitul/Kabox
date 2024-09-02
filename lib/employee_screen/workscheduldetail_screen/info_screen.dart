import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kbox/Common/common_button.dart';
import 'package:kbox/Common/common_color.dart';

import '../../Common/common_info_item.dart';
import '../../Common/common_text.dart';
import '../../Common/text_style.dart';
import '../viewdirections_screen/viewdirection_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

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

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                                    TextStyles.fifteenTSDarkGrayRegularFour,
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
                                          .fifteenTSDarkGrayRegularFour,
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
                          style: TextStyles.fifteenTSDarkGrayRegularFour,
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
                                    TextStyles.fifteenTSDarkGrayRegularFour,
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
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ViewDirectionScreen()),
                                    );
                                  },
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
                  padding: const EdgeInsets.only(
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
                  padding: const EdgeInsets.only(
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
}
