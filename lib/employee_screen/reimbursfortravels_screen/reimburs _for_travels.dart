import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_appbar.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_date_picker.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';
import 'package:intl/intl.dart';

class ReimbursForTravels extends StatefulWidget {
  const ReimbursForTravels({super.key});

  @override
  State<ReimbursForTravels> createState() => _ReimbursForTravelsState();
}

class _ReimbursForTravelsState extends State<ReimbursForTravels> {
  TextEditingController dateController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  DateTime? selectedDate;

  void _selectDate() async {
    final DateTime? picked = await CommonDatePicker.showDatePickerDialog(context);
    if (picked != null) {
      setState(() {
        selectedDate = picked;
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
          padding: const EdgeInsets.all(20.0),
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  CommonText.miles,
                  style: TextStyles.fourteenTSBlack,
                ),
              ),
              SizedBox(
                height: 42,
                child: CommonTextFormField(
                  controller: milesController,
                  hintText: '12345',
                  labelStyles: TextStyles.fourteenTSGreySemi,
                ),
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

              // CommonTextFormField(
              //   controller: noteController,
              //   labelText: CommonText.write_text_here,
              //   labelStyles: TextStyles.fourteenTSGreySemi,
              //   hintText: CommonText.write_text_here,
              //   maxLines: 3,
              // ),
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
