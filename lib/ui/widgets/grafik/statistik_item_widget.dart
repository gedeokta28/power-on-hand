import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class StatistikItemWidget extends StatelessWidget {
  final String title;
  final Function onTapLihat;
  final Widget chartWidget;
  final Color color;

  const StatistikItemWidget({
    Key key,
    @required this.title,
    @required this.color,
    @required this.onTapLihat,
    @required this.chartWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
      color: color,
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 8, 2, 0),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.varelaRound(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              height: Get.height / 3 - paddingX,
              child: chartWidget,
            ),
            FlatButton(
              visualDensity: VisualDensity.compact,
              onPressed: onTapLihat,
              child: Text(
                'Lihat Statistik',
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
