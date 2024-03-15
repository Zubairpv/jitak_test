
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitak_machine/controller/time_piker_controller.dart';
import 'package:jitak_machine/view/widgets/edit_text_field.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({
    super.key,
    required this.width,
    required this.timePickerController,
  });

  final double width;
  final TimePickerController timePickerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width > 700 ? width / 4 : width / 3,
      child: Obx(
        () => EditProfileTextfield(
          label: "営業時間",
          textEditingController: TextEditingController(
              text:
                  "${timePickerController.selectedTime.value!.hour}:${timePickerController.selectedTime.value!.minute}"),
          suffix: Icon(
            Icons.arrow_drop_down,
            size: width / 30,
          ),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: timePickerController.selectedTime.value!,
            );
            timePickerController.timePicker(pickedTime);
          },
        ),
      ),
    );
  }
}
