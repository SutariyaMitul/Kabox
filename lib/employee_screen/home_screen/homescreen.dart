import 'package:flutter/material.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'package:kbox/employee_screen/registerabsence_screen/register_absence.dart';
import 'package:kbox/employee_screen/reimbursfortravels_screen/reimburs%20_for_travels.dart';
import '../../Common/common_color.dart';
import '../../Common/common_container.dart';
import '../../Common/common_text.dart';
import '../../Common/text_style.dart';
import 'package:flutter/services.dart';

import '../request_for_work/available_for_work.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          CommonColor.blueColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: CommonColor.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: const Color(0xffF3F4F6),
          child: Stack(
            children: [
              Container(
                color: CommonColor.blueColor,
                height: MediaQuery.of(context).size.height / 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text(
                        "Friday, 12 juli",
                        style: TextStyles.fourteenTSWhite,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 27),
                      child: Text(
                        "Hej [first name]",
                        style: TextStyles.twentyTSWhite,
                      ),
                    ),
                    Card(
                      color: CommonColor.white,
                      elevation: 4,
                      shadowColor: Color(0xffececec),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Du har inga projekt idag",
                              style: TextStyles.sixteenTSBlack,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: CommonContainer(
                                    radius: 8,
                                    color: CommonColor.greenLight,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12),
                                          child: Text(
                                            "8 h",
                                            style: TextStyles.twentyTSGreen,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2, bottom: 12),
                                          child: Text(
                                            "Scheduled work",
                                            style: TextStyles.fourteenTSGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CommonContainer(
                                    radius: 8,
                                    color: CommonColor.blueLight,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12),
                                          child: Text(
                                            "0 h",
                                            style: TextStyles.twentyTSBlue,
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, bottom: 12),
                                          child: Text(
                                            "Clocked in time",
                                            style: TextStyles.fourteenTSBlue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MainActivity(selectedIndex: 1)),
                                      (route) => false,
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 17.0),
                                child: CommonContainer(
                                  radius: 8,
                                  color: CommonColor.blueColor,
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 13),
                                      child: Text(
                                        CommonText.gotoMySchedule,
                                        style: TextStyles.sixteenTSWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CommonContainer(
                      radius: 8,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AvailableForWork(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 17),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      CommonText.requestforwork,
                                      style: TextStyles.sizTeenDarkGreen,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: CommonColor.grayColor,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: CommonColor.greenGrayColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 4),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterAbsence(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      CommonText.registerabsence,
                                      style: TextStyles.sizTeenDarkGreen,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: CommonColor.grayColor,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17, bottom: 17),
                              child: Divider(
                                height: 1,
                                color: CommonColor.greenGrayColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ReimbursForTravels(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      CommonText.reimbursementForTravels,
                                      style: TextStyles.sizTeenDarkGreen,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: CommonColor.grayColor,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
