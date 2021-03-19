import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHistoryListTitleWidget extends StatelessWidget {
  final String title;
  final String date;
  final Function onTapDate;

  const DashboardHistoryListTitleWidget({
    Key key,
    @required this.title,
    @required this.date,
    this.onTapDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.varelaRound(
            fontSize: 16,
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
        InkWell(
          onTap: onTapDate,
          child: Text(
            date,
            style: GoogleFonts.varelaRound(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFBACCFD),
            ),
          ),
        ),
      ],
    );
  }
}
