import 'package:flutter/material.dart';
import 'package:jitak_machine/view/widgets/label_text.dart';

class EditProfileTextfield extends StatelessWidget {
  final String? label;
  final TextEditingController textEditingController;
  final bool? isPhoneNumber;
  final Icon? suffix;
  final Function()? onTap;

  const EditProfileTextfield(
      {super.key,
      this.label,
      required this.textEditingController,
      this.isPhoneNumber,
      this.suffix,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Labeltext(
            label: label!,
          )
        else
          SizedBox(
            height: size.width < 700 ? size.width / 25 : size.width / 28,
          ),
        SizedBox(
          height: size.width < 700 ? 45 : 90,
          child: TextField(
            onTap: onTap,
            keyboardType: isPhoneNumber != null
                ? isPhoneNumber!
                    ? TextInputType.number
                    : TextInputType.text
                : TextInputType.text,
            controller: textEditingController,
            style: TextStyle(
                fontSize: size.width < 700 ? size.width / 25 : size.width / 28),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xFFE8E8E8),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                suffix: suffix,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xFFE8E8E8),
                  ),
                  borderRadius: BorderRadius.circular(5),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
