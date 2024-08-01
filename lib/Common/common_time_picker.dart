import 'package:flutter/material.dart';

class CommonTimePicker{
  static Future<TimeOfDay?> showTimePickerDialog(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return picked;
  }
}