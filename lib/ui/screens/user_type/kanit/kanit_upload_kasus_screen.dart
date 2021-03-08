import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';

class KanitUploadKasusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Input Kasus',
      buttonOnTap: () {
        showToast('wip');
      },
      buttonText: 'Upload',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndChipWidget(
            text: 'Kepada',
            textChip: 'Wadir',
          ),
          TextAndChipWidget(
            text: 'Dari',
            textChip: 'Kasubdit',
          ),
          SizedBox(height: sy(8)),
          Text(
            'Laporan Masuk',
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(sy(8)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(sy(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Nama Penyidik',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Perkara',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tanggal',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                LaporanListItem(),
                LaporanListItem(),
                LaporanListItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LaporanListItem extends StatelessWidget {
  const LaporanListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sy(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(FontAwesomeIcons.squareFull, color: Colors.black54, size: sy(12)),
          RoundedChipColor(text: 'Arif Sucahyo', color: Color(0xFFB5FF88)),
          RoundedChipColor(text: 'Judi Online', color: Color(0xFF3DB9FF)),
          RoundedChipColor(text: '21/02/2021', color: Color(0xFFFF8080)),
        ],
      ),
    );
  }
}

class RoundedChipColor extends StatelessWidget {
  final String text;
  final Color color;
  final double padding;
  final Color fontColor;
  final double fontSize;

  const RoundedChipColor({
    Key key,
    this.text,
    this.color,
    this.padding = 6,
    this.fontColor,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.varelaRound(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: fontColor,
        ),
      ),
    );
  }
}
