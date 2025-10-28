import 'package:flutter/material.dart';

class DefaultBackgroundImage extends StatelessWidget {
  final String src;
  final double width, height, opacity;
  final Alignment aligment;
  final EdgeInsets margin;

  const DefaultBackgroundImage({
    super.key,
    required this.src,
    required this.width,
    required this.height,
    required this.opacity,
    this.aligment = Alignment.center,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      margin: margin,
      child: Image.asset(
        src,
        width: width,
        height: height,
        opacity: AlwaysStoppedAnimation(opacity),
      ),
    );
  }
}
