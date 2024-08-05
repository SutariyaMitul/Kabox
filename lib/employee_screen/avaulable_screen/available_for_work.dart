import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_date_picker.dart';
import 'package:kbox/Common/common_time_picker.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import '../../Common/common_appbar.dart';
import '../../Common/common_text.dart';
import '../../Common/common_textfiled.dart';
import '../../Common/text_style.dart';
import 'package:intl/intl.dart';

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

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? selectedUntilDate;
  TimeOfDay? selectedUntilTime;

  void _selectDate() async {
    final DateTime? picked = await CommonDatePicker.showDatePickerDialog(context);
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? picked = await CommonTimePicker.showTimePickerDialog(context);
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _selectUntilDate() async {
    final DateTime? picked = await CommonDatePicker.showDatePickerDialog(context);
    if (picked != null) {
      setState(() {
        selectedUntilDate = picked;
      });
    }
  }

  void _selectUntilTime() async {
    final TimeOfDay? picked = await CommonTimePicker.showTimePickerDialog(context);
    if (picked != null) {
      setState(() {
        selectedUntilTime = picked;
      });
    }
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }


  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
        title: CommonText.availability,
        bottomNavigationBar: CommonBottomBar(
          onTap: (int index) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => MainActivity(selectedIndex: index)),
              (route) => false,
            );
          },
        ),
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
                    padding: const EdgeInsets.only(top: 15.0,bottom: 6.0),
                    child: Text(
                      CommonText.from,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: _selectDate,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                        color: CommonColor.textInputBgColor,
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
                            selectedDate != null? formatDate(selectedDate!): CommonText.selectDate,
                            style: TextStyle(
                              color: CommonColor.grayColor,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        _selectTime();
                      },
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                              child: Icon(
                                Icons.access_time,
                                color: Color(0xff6B7280),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Center(
                              child: Text(
                                selectedTime != null? DateFormat('h:mm a').format(DateTime(2000, 1, 1, selectedTime!.hour, selectedTime!.minute)): '00:00',
                                style: TextStyle(
                                  color: CommonColor.grayColor,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0,bottom: 8),
                    child: Text(
                      CommonText.until,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectUntilDate();
                    },
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
                            selectedUntilDate != null? formatDate(selectedUntilDate!): CommonText.selectDate,
                            style: TextStyle(
                              color: CommonColor.grayColor,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        _selectUntilTime();
                      },
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                              child: Icon(
                                Icons.access_time,
                                color: Color(0xff6B7280),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Center(
                              child: Text(
                                  selectedUntilTime != null? DateFormat('h:mm a').format(DateTime(2000, 1, 1, selectedUntilTime!.hour, selectedUntilTime!.minute)): '00:00',
                                style: TextStyle(
                                  color: CommonColor.grayColor,
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
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 16.0,bottom: 8.0),
                    child: Text(
                      CommonText.note,
                      style: TextStyles.fourteenTSBlack,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    decoration: ShapeDecoration(
                      color: CommonColor.textInputBgColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD1D5DB)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextFormField(
                        controller: noteController,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyles.fourteenTSBlack,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintStyle: TextStyles.fourteenTSGrey,
                          hintText: CommonText.write_text_here,
                          contentPadding: const EdgeInsets.all(10),
                          //alignLabelWithHint: true,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          filled: true,
                          fillColor: CommonColor.textInputBgColor,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
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
