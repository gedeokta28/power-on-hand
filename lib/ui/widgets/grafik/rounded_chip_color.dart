import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedChipColor extends StatelessWidget {
  final String text;
  final Color color;
  final double padding;
  final Color fontColor;
  final double fontSize;

  const RoundedChipColor({
    Key key,
    this.text,
    this.color,
    this.padding = 6,
    this.fontColor,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.varelaRound(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: fontColor,
        ),
      ),
    );
  }
}
