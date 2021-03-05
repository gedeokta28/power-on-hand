import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';

class DashboardHistoryItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const DashboardHistoryItemWidget({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sy(170),
      height: sy(200),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xFFEBEEFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: sy(120)),
          Text(
            title,
            style: GoogleFonts.varelaRound(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: sy(10)),
          PrimaryButton(
            title: 'Lihat Kasus',
            color: Color(0xFF1657FF),
            fontColor: Colors.white,
            onPressed: onTap,
          )
        ],
      ),
    );
  }
}
