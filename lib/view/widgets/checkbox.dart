import 'package:flutter/material.dart';

class CostomCheck extends StatelessWidget {
  final bool isSelected;
  final String content;
  final Function(bool?)? onChanged;
  const CostomCheck(
      {super.key,
      required this.isSelected,
      required this.content,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;

    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      side: isSelected
          ? BorderSide.none
          : MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(
                width: 2.0,
                color: Color(0xFFE8E8E8),
              ),
            ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    );

    return Theme(
      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(),
        tristate: true,
        activeColor: const Color(0xFFEE7D42),
        overlayColor: const MaterialStatePropertyAll(
          Color(0xFFEE7D42),
        ),
        onChanged: onChanged,
        value: isSelected,
        title: Text(content),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
