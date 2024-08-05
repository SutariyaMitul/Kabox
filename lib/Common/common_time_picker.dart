import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';

class CommonTimePicker{
    static Future<TimeOfDay?> showTimePickerDialog(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CommonColor.blueColor,
              onPrimary: CommonColor.white,
              onSurface: CommonColor.black,
            ),timePickerTheme: TimePickerThemeData(
              dayPeriodTextColor: WidgetStateColor.resolveWith((states){
                if (states.contains(WidgetState.selected)) {
                  return CommonColor.white;
                }
                return CommonColor.blueColor;
              }),
            dayPeriodColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return CommonColor.blueColor;
              }
              return CommonColor.white;
            }),
          ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CommonColor.colorBlue,
              ),
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: CommonColor.red,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return picked;
  }
}