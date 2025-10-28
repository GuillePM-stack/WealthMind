import 'package:flutter/material.dart';

class DefaultImages extends StatelessWidget {
  final String src;
  final double width, height;
  final Alignment alignment;
  final EdgeInsets margin;

  const DefaultImages({
    super.key,
    required this.src,
    required this.width,
    required this.height,
    this.alignment = Alignment.centerRight,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      child: Image.asset(src, width: width, height: height),
    );
  }
}
