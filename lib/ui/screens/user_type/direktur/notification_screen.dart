import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseBottomMenu(
          children: [
            SizedBox(
              height: sy(510),
              child: ListView(
                children: [
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + sy(14)),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: Text(
                'Notifications',
                style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(paddingX),
          padding: EdgeInsets.all(paddingX),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0.5,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(FontAwesomeIcons.userAlt, size: 24),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Iptu Adam | Unit III Siber Crime',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Telah Mengupload Laporan Harian Ke Kanit III',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  RoundedChipColor(
                    text: '1 Menit Yang Lalu',
                    color: Colors.greenAccent,
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: sy(20),
          right: 20,
          child: RoundedChipColor(text: 'NEW', color: Colors.orange.shade600, fontSize: 10),
        ),
        Positioned(
          bottom: sy(20),
          right: 20,
          child: RoundedChipColor(text: 'Lihat Laporan', color: Colors.blue.shade300, fontSize: 10),
        ),
      ],
    );
  }
}
