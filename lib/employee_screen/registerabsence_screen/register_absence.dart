import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kbox/Common/common_appbar.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_date_picker.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/common_time_picker.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'package:intl/intl.dart';

class RegisterAbsence extends StatefulWidget {
  const RegisterAbsence({super.key});

  @override
  State<RegisterAbsence> createState() => _RegisterAbsenceState();
}

class _RegisterAbsenceState extends State<RegisterAbsence> {
  final List<String> absenceType = [
    'Health Problem',
    'Location',
    'Family Function',
    'Other'
  ];
  String selectedType = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool daySwitchStatus = true;

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
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return CommonAppbar(
      //bottomNavigationBar: const CommonBottomBar(),
      bottomNavigationBar: CommonBottomBar(
        onTap: (int index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => MainActivity(selectedIndex: index)),
                (route) => false,
          );
        },
      ),
      title: CommonText.registerabsence,
      centerTitle: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(CommonText.typeOfAbsence,
                    style: TextStyles.fourteenTSBlackMedium,
                  ),
                ),
                Container(
                  height: 42,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: CommonColor.borderColor, width: 1.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<String>(

                    borderRadius: BorderRadius.circular(10),
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: Text(
                      CommonText.chooseTypeOfAbsence,
                      style: TextStyles.fourteenTSGreySemi,
                    ),
                    items: absenceType.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedType = value!;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 8),
                  child: Text(
                    CommonText.date,
                    style: TextStyles.fourteenTSBlackMedium,
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterSwitch(
                        value: daySwitchStatus,
                        width: 40,
                        height: 20,
                        padding: 3.0,
                        toggleSize: 15.0,
                        borderRadius: 10.0,
                        activeColor: const Color(0xff1A56DB),
                        onToggle: (value) {
                          if (daySwitchStatus == true) {
                            setState(() {
                              daySwitchStatus = false;
                            });
                          } else {
                            setState(() {
                              daySwitchStatus = true;
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
                const SizedBox(
                  height: 15,
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    CommonText.absence,
                    style: TextStyles.fourteenTSBlackMedium,
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
                const SizedBox(
                  height: 10,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    CommonText.note,
                    style: TextStyles.fourteenTSBlackMedium,
                  ),
                ),
                CommonTextFormField(
                  controller: dateController,
                  labelText: CommonText.writeTextHere,
                  labelStyles: TextStyles.fourteenTSGrey,
                  maxLines: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    CommonText.optional,
                    style: TextStyles.twelveTSGrey,
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
