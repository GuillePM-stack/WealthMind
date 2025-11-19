import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color colorText;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorText = Colors.black,
    this.backgroundColor = Colors.white,
    this.margin = const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
