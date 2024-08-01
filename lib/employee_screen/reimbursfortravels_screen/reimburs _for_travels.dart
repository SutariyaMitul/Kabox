import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_appbar.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';

class ReimbursForTravels extends StatefulWidget {
  const ReimbursForTravels({super.key});

  @override
  State<ReimbursForTravels> createState() => _ReimbursForTravelsState();
}

class _ReimbursForTravelsState extends State<ReimbursForTravels> {
  TextEditingController dateController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: CommonText.reimbursementForTravels,
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
        color: CommonColor.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.date,
                  style: TextStyles.fourteenTSBlack,
                ),
              ),
              CommonTextFormField(
                  height: 42,
                  controller: dateController,
                  labelText: CommonText.selectDate,
                  labelStyles: TextStyles.fourteenTSGreySemi,
                  prefixIcon: SvgPicture.asset(
                    "assets/images/calendar.svg",
                    fit: BoxFit.scaleDown,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.miles,
                  style: TextStyles.fourteenTSBlack,
                ),
              ),
              CommonTextFormField(
                height: 42,
                controller: milesController,
                labelText: '12345',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.milesDetail,
                  style: TextStyles.fourteenTSGreySemi,
                ),
              ),
              const SizedBox(
                height: 15,
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
                labelStyles: TextStyles.fourteenTSGreySemi,
                maxLines: 3,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.note_extrainfo,
                  style: TextStyles.fourteenTSGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
