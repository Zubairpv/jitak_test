
import 'package:flutter/material.dart';

class Labeltext extends StatelessWidget {
  final String label;

  const Labeltext({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
                color: Colors.black,
                fontSize: size.width < 700 ? size.width / 25 : size.width / 28),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Colors.red,
              fontSize: size.width < 700 ? size.width / 25 : size.width / 28,
            ),
          ),
        ],
      ),
    );
  }
}
