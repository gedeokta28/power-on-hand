import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHistoryListTitleWidget extends StatelessWidget {
  final String title;
  final String date;

  const DashboardHistoryListTitleWidget({
    Key key,
    @required this.title,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.varelaRound(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF353E6C),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, right: 4),
          child: Icon(
            FontAwesomeIcons.calendarAlt,
            size: 14,
            color: Color(0xFFBACCFD),
          ),
        ),
        Text(
          date,
          style: GoogleFonts.varelaRound(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFBACCFD),
          ),
        ),
      ],
    );
  }
}
