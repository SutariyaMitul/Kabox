import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'package:kbox/employee_screen/workscheduldetail_screen/work_schedule_detail.dart';

import '../../Common/common_border_container.dart';
import '../../Common/common_color.dart';
import '../../Common/text_style.dart';
import 'package:intl/intl.dart';


class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String startDate = 'Jul 8';
  String endDate = 'Jul 14';

  final CalendarWeekController _controller = CalendarWeekController();

  List<String> dayOfWeekDefault = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: CommonColor.bgColor,
      appBar: AppBar(
          backgroundColor: CommonColor.blueColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: CommonColor.white,
                size: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                startDate,
                style: TextStyles.eighteenTSWhiteNormal,
              ),
              Text(
                " - ${endDate}",
                style: TextStyles.eighteenTSWhiteNormal,
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: CommonColor.white,
                size: 20,
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              height: 37,
              width: 88,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/calendar_icon_one.svg",
                    width: 16,
                    height: 16,
                    color: CommonColor.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Today',
                      style: TextStyles.fourteenTSBlack,
                    ),
                  )
                ],
              ),
            )
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: CalendarWeek(
              controller: _controller,
              showMonth: false,
              // weekendsIndexes: [6],
              minDate: DateTime.now().add(
                const Duration(days: -365),
              ),
              maxDate: DateTime.now().add(
                const Duration(days: 365),
              ),
              onDatePressed: (DateTime datetime) {
                // Do something
                setState(() {});
              },
              onDateLongPressed: (DateTime datetime) {
                // Do something
              },
              onWeekChanged: () {
                // Do something
              },
              weekendsStyle: TextStyles.fourteenTSGrey,
              dateStyle: TextStyles.sixteenTSBlack,
              dayOfWeek: dayOfWeekDefault,
              todayBackgroundColor: const Color(0xffE1EFFE),
              // weekendsIndexes: [6],
              dayOfWeekStyle: TextStyles.fourteenTSGrey,
              pressedDateBackgroundColor: CommonColor.colorBlue,
              pressedDateStyle: TextStyles.sixteenTSWhite,
              todayDateStyle: TextStyles.sixteenTSBlack,
              monthViewBuilder: (DateTime time) => Align(
                alignment: FractionalOffset.center,
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMM().format(time),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
              ),
              decorations: [
                DecorationItem(
                  decorationAlignment: FractionalOffset.bottomCenter,
                  date: DateTime.now(),
                  decoration: const SizedBox(height: 3,width: 3,),
                ),
                // DecorationItem(
                //     date: DateTime.now().add(const Duration(days: 3)),
                //     decoration: const Text(
                //       'Holiday',
                //       style: TextStyle(
                //         color: Colors.brown,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monday',
                            style: TextStyles.eighteenTSBlackSemiBold,
                          ),
                           Text(
                            '7:30h',
                            style: TextStyles.fourteenTSGrey,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: CommonBorderContainer(
                        color: CommonColor.skyGreenLight,
                        width: width,
                        borderColor: CommonColor.skyGreenDark,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                '08:00 - 11:30',
                                style: TextStyle(
                                    color: CommonColor.darkGreenText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                    color: CommonColor.darkGreenText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Huskvarnavägen 62, Jönköping',
                                style: TextStyle(
                                    color: CommonColor.darkGreenText,
                                    fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkScheduleDetail(),
                            ));
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkScheduleDetail(),
                            ));
                      },
                      child: CommonBorderContainer(
                        color: CommonColor.blueLight,
                        width: width,
                        borderColor: CommonColor.blueColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                '08:00 - 11:30',
                                style: TextStyle(
                                    color: CommonColor.blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                    color: CommonColor.blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Huskvarnavägen 62, Jönköping',
                                style: TextStyle(
                                    color: CommonColor.blueColor, fontSize: 14,fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
