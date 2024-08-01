import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../Common/common_appbar.dart';
import '../../Common/common_color.dart';
import '../../Common/common_text.dart';
import '../../Common/common_textfiled.dart';
import '../../Common/text_style.dart';

class AvailableForWork extends StatefulWidget {
  const AvailableForWork({super.key});

  @override
  State<AvailableForWork> createState() => _AvailableForWorkState();
}

class _AvailableForWorkState extends State<AvailableForWork> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController fromTimeController = TextEditingController();
  TextEditingController utilDateController = TextEditingController();
  TextEditingController utilTimeController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool switchState = true;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
        title: CommonText.availability,
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: CommonColor.bgColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterSwitch(
                            value: switchState,
                            width: 40,
                            height: 20,
                            padding: 3.0,
                            toggleSize: 15.0,
                            borderRadius: 10.0,
                            duration: const Duration(milliseconds: 500),
                            activeColor: const Color(0xff1A56DB),
                            onToggle: (value) {
                              if (switchState == true) {
                                setState(() {
                                  switchState = false;
                                });
                              } else {
                                setState(() {
                                  switchState = true;
                                });
                              }
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            CommonText.fulldDay,
                            style: TextStyles.fourteenTSBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 5.0),
                    child: Text(
                      CommonText.from,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF9FAFB),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD1D5DB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/calendar.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          CommonText.selectDate,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF9FAFB),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFD1D5DB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.access_time,
                              color: Color(0xff6B7280),
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 8),
                          Center(
                            child: Text(
                              "00:00",
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      CommonText.until,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF9FAFB),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD1D5DB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/calendar.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          CommonText.selectDate,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF9FAFB),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFD1D5DB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.access_time,
                              color: Color(0xff6B7280),
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 8),
                          Center(
                            child: Text(
                              "00:00",
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      CommonText.note,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  CommonTextFormField(
                    controller: noteController,
                    labelText: CommonText.write_text_here,
                    labelStyles: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280),
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal
                    ),
                    maxLines: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text(
                      CommonText.note_extrainfo,
                      style: TextStyles.fourteenTSGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
