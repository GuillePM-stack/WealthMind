import 'package:flutter/material.dart';

class RotatedText extends StatelessWidget {
  final String text;
  final bool isBold;

  const RotatedText({super.key, required this.text, this.isBold = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          isBold
              ? null
              : () {
                Navigator.pushNamed(context, text);
              },

      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: isBold ? 24 : 27,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
