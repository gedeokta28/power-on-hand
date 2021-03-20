import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class SubditDaftarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomMenu(
      title: 'Daftar Kasus',
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 8, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                        child: TextField(
                          autofocus: false,
                          onChanged: (value) {
                            // entreProv.searchCarWashAndItem(value);
                            print(value);
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Cari Kasus',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Icon(FontAwesomeIcons.search, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                HelperUtils.getDatePicker();
              },
              child: Ink(
                padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(FontAwesomeIcons.calendarDay, size: 20),
              ),
            ),
          ],
        ),
        SubditDaftarItem(),
        SubditDaftarItem(),
        SubditDaftarItem(),
        SubditDaftarItem(),
      ],
    );
  }
}

class SubditDaftarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: paddingX),
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
              Image(
                height: 40,
                image: AssetImage('assets/images/history_item.png'),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kasus 01',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Penyidik: Brigadi Angga Saputra ',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Telah Mengupload Laporan Harian Ke Kanit III',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Created at 7 Maret 2021',
                    style: GoogleFonts.varelaRound(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: sy(20),
          right: 20,
          child: RoundedChipColor(text: 'View', color: Colors.green.shade300, fontSize: 14),
        ),
      ],
    );
  }
}
