import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalfColorButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final Function onTap;

  const HalfColorButtonWidget({
    Key key,
    @required this.text,
    @required this.color,
    @required this.width,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(height: 14),
                Container(color: color, height: 14),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: GoogleFonts.varelaRound(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
