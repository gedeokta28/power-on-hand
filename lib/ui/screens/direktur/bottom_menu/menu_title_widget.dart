import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class MenuTitleWidget extends StatelessWidget {
  final String title;

  const MenuTitleWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingX, 0, paddingX, paddingX),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.varelaRound(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
