import 'package:flutter/material.dart';

class DefaultSeparatorText extends StatelessWidget {
  final String text;
  final Color colorText, lineColor;

  const DefaultSeparatorText({
    super.key,
    required this.text,
    this.colorText = Colors.white,
    this.lineColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: lineColor,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          text,
          style: TextStyle(
            color: colorText,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        Container(
          width: 25,
          height: 1,
          color: lineColor,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }
}
