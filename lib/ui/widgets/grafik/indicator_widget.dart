import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    this.color,
    this.text,
    this.isSquare = true,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: <Widget>[
          Container(
            width: 10,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          SizedBox(width: 2),
          SizedBox(
            width: 38,
            child: Text(
              text,
              style: GoogleFonts.varelaRound(
                fontSize: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 2),
        ],
      ),
    );
  }
}
