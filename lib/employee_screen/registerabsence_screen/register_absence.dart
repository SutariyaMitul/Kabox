import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    'Ocation',
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Type of absence',
                style: TextStyles.fourteenTSBlackMedium,
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: CommonColor.borderColor, width: 1.0)),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<String>(

                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text(
                  'Choose type of absence',
                  style: TextStyles.fourteenTSGrey,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                CommonText.date,
                style: TextStyles.fourteenTSBlackMedium,
              ),
            ),
            CommonTextFormField(
              controller: dateController,
              labelText: CommonText.from,
              labelStyles: TextStyles.fourteenTSGrey,
              prefixIcon: SvgPicture.asset(
                'assets/images/calendar-month.svg',
                width: 10,
                height: 10,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Switch(
                  value: daySwitchStatus,
                  onChanged: (value) {
                    if (daySwitchStatus == true) {
                      setState(() {
                        daySwitchStatus = false;
                      });
                    } else {
                      setState(() {
                        daySwitchStatus = true;
                      });
                    }
                  },
                  activeColor: Colors.white,
                  activeTrackColor: CommonColor.colorBlue,
                ),
                const Text(
                  CommonText.fullday,
                  style: TextStyles.fourteenTSBlackMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Absence (hours)",
                style: TextStyles.fourteenTSBlackMedium,
              ),
            ),
            CommonTextFormField(
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Note",
                style: TextStyles.fourteenTSBlackMedium,
              ),
            ),
            CommonTextFormField(
              controller: dateController,
              labelText: 'Write text here ...',
              labelStyles: TextStyles.fourteenTSGrey,
              height: 100,
              maxLines: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Optional note for extra info",
                style: TextStyles.twelveTSGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
