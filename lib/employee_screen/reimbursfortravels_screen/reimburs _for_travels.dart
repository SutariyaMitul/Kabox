import 'package:flutter/material.dart';

import '../../Common/common_appbar.dart';
import '../../Common/common_color.dart';
import '../../Common/common_text.dart';
import '../../Common/common_textfiled.dart';
import '../../Common/text_style.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.date,
                  style: TextStyles.fourteenTSBlack,
                ),
              ),
              CommonTextFormField(
                controller: dateController,
                labelText: CommonText.selectDate,
                labelStyles: TextStyles.fourteenTSGreySemi,
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: CommonColor.grayColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  CommonText.miles,
                  style: TextStyles.fourteenTSBlack,
                ),
              ),
              CommonTextFormField(
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
