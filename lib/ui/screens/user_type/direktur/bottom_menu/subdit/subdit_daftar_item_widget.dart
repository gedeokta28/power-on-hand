import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class SubditDaftarItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final String subtitle;
  final String penyidik;
  final DateTime date;

  const SubditDaftarItem({
    this.onTap,
    @required this.title,
    this.subtitle,
    this.penyidik,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: paddingX),
            padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
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
                      title,
                      style: GoogleFonts.varelaRound(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    penyidik == null
                        ? SizedBox()
                        : Text(
                            penyidik,
                            style: GoogleFonts.varelaRound(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                    SizedBox(height: 4),
                    subtitle == null
                        ? SizedBox()
                        : Text(
                            subtitle ?? '',
                            style: GoogleFonts.varelaRound(
                              color: Colors.black54,
                              fontSize: 11,
                            ),
                          ),
                    SizedBox(height: 4),
                    Text(
                      'Created at 7 Maret 2021',
                      style: GoogleFonts.varelaRound(
                        color: Colors.black54,
                        fontSize: 11,
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
            child: RoundedChipColor(
              text: 'View',
              color: Colors.green.shade300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
