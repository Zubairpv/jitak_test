import 'package:flutter/material.dart';

Widget navItem(IconData icon, bool selected, String label,
    {Function()? onTap, required Size size}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: size.width < 650 ? size.width / 20 : size.width / 40,
          ),
          Icon(
            icon,
            size: size.width / 20,
            color: selected ? Colors.yellow : Colors.black.withOpacity(0.4),
          ),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.yellow : Colors.black,
              fontSize: size.width / 30,
            ),
          ),
        ],
      ),
    ),
  );
}
