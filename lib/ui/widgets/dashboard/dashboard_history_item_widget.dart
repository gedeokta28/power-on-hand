import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/ui/widgets/primary_button.dart';

class DashboardHistoryItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final ImageProvider image;

  const DashboardHistoryItemWidget({
    Key key,
    @required this.title,
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xFFEBEEFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            child: Image(
              image: image ?? AssetImage('assets/images/history_item.png'),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
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
