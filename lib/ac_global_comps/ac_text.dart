import 'package:flutter/material.dart';

class AcText extends StatelessWidget {
  /// add your params here
  final String title;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const AcText(
      {super.key,
      required this.title,
      this.color,
      required this.size,
      this.alien,
      this.fontFamily,
      this.decoration,
      this.overflow,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: alien ?? TextAlign.start,
        // ignore: deprecated_member_use
        textScaleFactor: 1.2,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? 16,
          decoration: decoration ?? TextDecoration.none,
          fontWeight: fontWeight,
          overflow: overflow,
          fontFamily: fontFamily,
        ));
  }
}
