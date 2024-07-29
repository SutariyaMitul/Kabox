import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
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

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: CommonColor.blueColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                startDate,
                style: TextStyles.fourteenTSWhite,
              ),
              Text(
                " - ${endDate}",
                style: TextStyles.fourteenTSWhite,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 17,
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8),
              child:  Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
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
          CalendarWeek(
            controller: _controller,
            height: 120,
            showMonth: false,
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
            weekendsStyle: TextStyles.sixteenTSGrey,
            dateStyle: TextStyles.sixteenTSBlack,
            todayBackgroundColor: const Color(0xffE1EFFE),
            dayOfWeekStyle: TextStyles.sixteenTSGrey,
            pressedDateBackgroundColor: CommonColor.colorBlue,
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
                decoration: const Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 5,
                ),
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        borderColor: CommonColor.greenColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                '08:00 - 11:30',
                                style: TextStyle(
                                    color: CommonColor.greenColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                    color: CommonColor.greenColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Huskvarnavägen 62, Jönköping',
                                style: TextStyle(
                                    color: CommonColor.greenColor,
                                    fontSize: 14),
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
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                '08:00 - 11:30',
                                style: TextStyle(
                                    color: CommonColor.blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                    color: CommonColor.blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Huskvarnavägen 62, Jönköping',
                                style: TextStyle(
                                    color: CommonColor.blueColor, fontSize: 14),
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
          )
        ],
      ),
    );
  }
}
