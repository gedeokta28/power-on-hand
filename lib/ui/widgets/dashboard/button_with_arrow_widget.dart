import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';

class ButtonWithArrowWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isFlex;
  final Color color;

  const ButtonWithArrowWidget({
    Key key,
    @required this.text,
    @required this.onTap,
    this.isFlex = false,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: color ?? Colors.grey[300].withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0.5,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.varelaRound(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            isFlex ? Spacer() : SizedBox(width: sy(22)),
            Icon(FontAwesomeIcons.chevronRight)
          ],
        ),
      ),
    );
  }
}
