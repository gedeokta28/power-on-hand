import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/menu_item_long_grey_widget.dart';
import 'package:power_on_hand/ui/screens/user_type/kanit/kanit_upload_kasus_screen.dart';

class GelarPerkara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 36),
          child: MenuItemLongGreyWidget(title: 'DAFTAR GELAR PERKARA'),
        ),
        Container(
          height: sy(410),
          margin: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1),
                blurRadius: 1,
                spreadRadius: 0.1,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.chevronLeft,
                    size: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Unit II',
                      style: GoogleFonts.varelaRound(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedChipColor(
                    text: 'Nama Angota',
                    color: Colors.yellow.shade300,
                    padding: 8,
                    fontSize: 14,
                  ),
                  RoundedChipColor(
                    text: 'Lihat Gelar Perkara',
                    color: Colors.red.shade300,
                    padding: 8,
                    fontSize: 14,
                    fontColor: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedChipColor(
                    text: 'Nama Angota',
                    color: Colors.yellow.shade300,
                    padding: 8,
                    fontSize: 14,
                  ),
                  RoundedChipColor(
                    text: 'Lihat Gelar Perkara',
                    color: Colors.red.shade300,
                    padding: 8,
                    fontSize: 14,
                    fontColor: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedChipColor(
                    text: 'Nama Angota',
                    color: Colors.yellow.shade300,
                    padding: 8,
                    fontSize: 14,
                  ),
                  RoundedChipColor(
                    text: 'Lihat Gelar Perkara',
                    color: Colors.red.shade300,
                    padding: 8,
                    fontSize: 14,
                    fontColor: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedChipColor(
                    text: 'Nama Angota',
                    color: Colors.yellow.shade300,
                    padding: 8,
                    fontSize: 14,
                  ),
                  RoundedChipColor(
                    text: 'Lihat Gelar Perkara',
                    color: Colors.red.shade300,
                    padding: 8,
                    fontSize: 14,
                    fontColor: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
