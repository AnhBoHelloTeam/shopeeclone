import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
   final TextAlign textAlign;
   final TextStyle? style;


  const SubtitleTextWidget({
    super.key,
    required this.label,
    this.fontSize =20,
    this.fontStyle= FontStyle.normal,
    this.fontWeight=FontWeight.normal,
    this.color,
    this.textDecoration=TextDecoration.none,
    this.textAlign = TextAlign.center, this.style,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
      ),
    );
  }
}
