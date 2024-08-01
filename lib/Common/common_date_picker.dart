import 'package:flutter/material.dart';

class CommonDatePicker {
  static Future<DateTime?> showDatePickerDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),

    );
    return picked;

  }
}