import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/grafik/laporan_list_item.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';

class PanitUploadKasusScreen extends StatelessWidget {
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
          SizedBox(height: 8),
          Text(
            'Laporan Masuk',
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
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
            child: Column(
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
