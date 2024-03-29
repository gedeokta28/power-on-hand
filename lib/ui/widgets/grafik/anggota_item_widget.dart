import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class AnggotaItemWidget extends StatelessWidget {
  const AnggotaItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(sy(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sy(12), vertical: sy(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.userSecret,
              color: Colors.black,
              size: 42,
            ),
            SizedBox(height: 12),
            SizedBox(
              width: 80,
              child: Text(
                'Bripka Andrea',
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Dinas',
                style: GoogleFonts.varelaRound(
                  fontSize: 12,
                  color: Colors.white,
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
