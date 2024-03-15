import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerController extends GetxController {
  Rx<TimeOfDay?> selectedTime = TimeOfDay.now().obs;

  Future<void> timePicker(TimeOfDay? pickedTime) async {
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }
}
