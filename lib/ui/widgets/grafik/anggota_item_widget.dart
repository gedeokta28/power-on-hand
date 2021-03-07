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
        gradient: new LinearGradient(
          colors: [Colors.lightBlueAccent.shade100, Colors.lightBlueAccent.shade100.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(sy(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sy(12), vertical: sy(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.userSecret,
              color: Colors.black,
              size: sy(42),
            ),
            SizedBox(height: sy(12)),
            SizedBox(
              width: sx(90),
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
            SizedBox(height: sy(6)),
            Container(
              padding: EdgeInsets.all(sy(6)),
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(sy(20)),
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
