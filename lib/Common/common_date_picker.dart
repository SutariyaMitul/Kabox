import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';

class CommonDatePicker {
  static Future<DateTime?> showDatePickerDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CommonColor.blueColor,
              onPrimary: CommonColor.white,
              onSurface: CommonColor.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CommonColor.colorBlue,
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