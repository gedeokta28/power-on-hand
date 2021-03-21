import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/bottom_sheet/statistik_penilaian_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Clippath
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFFC2424), Color(0xFF9D7AFF)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: Get.back,
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  SizedBox(
                    width: Get.width / 1.5,
                    child: Text(
                      'My Profile',
                      style: GoogleFonts.varelaRound(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Text(
                    'Biography',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nama: Bagus Pratama',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pangkat : Brigadir',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Age: 27',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Birthday: 24-02-2000',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Sex: Male',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: PointWidget(
                      text: 'Point',
                      textChip: '25',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
