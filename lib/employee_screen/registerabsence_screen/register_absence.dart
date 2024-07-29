import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kbox/Common/common_appbar.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';

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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return CommonAppbar(
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
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    CommonText.date,
                    style: TextStyles.fourteenTSBlackMedium,
                  ),
                ),
                CommonTextFormField(
                  height: 42,
                  controller: dateController,
                  labelText: CommonText.from,
                  labelStyles: TextStyles.fourteenTSGrey,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/calendar.svg',
                    width: 14,
                    height: 14,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                  height: 10,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    CommonText.absence,
                    style: TextStyles.fourteenTSBlackMedium,
                  ),
                ),
                CommonTextFormField(
                  height: 42,
                  controller: dateController,
                  labelText: '08:00',
                  labelStyles: TextStyles.fourteenTSGrey,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/clock-outline.svg',
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
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
                  height: 100,
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
