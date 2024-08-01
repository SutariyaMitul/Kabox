import 'package:flutter/material.dart';

class CommonDatePicker {
  static Future<DateTime?> selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return selectedDate;
  }
}
