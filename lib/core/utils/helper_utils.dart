import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HelperUtils {
  static Future getTimePicker() async {
    final TimeOfDay picked = await showTimePicker(
      context: Get.context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
    );
    if (picked != null) {
      return picked;
    }
  }

  static Future getDatePicker({DateTime firstDate, DateTime lastDate}) async {
    final DateTime picked = await showDatePicker(
      context: Get.context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime.now().subtract(Duration(days: 365)),
      lastDate: lastDate ?? DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      return picked;
    }
  }

  static String getHumanDate(DateTime date, {String format}) {
    return DateFormat(format ?? "dd MMM y, HH:mm").format(date.toLocal()).toString();
  }
}
