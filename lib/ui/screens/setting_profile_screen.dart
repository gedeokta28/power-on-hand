import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';
import 'package:power_on_hand/ui/widgets/text_field_widget.dart';

class SettingProfileScreen extends StatelessWidget {
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
                      'Setting My Profile',
                      style: GoogleFonts.varelaRound(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'Nama :',
                  ),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'Pangkat :',
                  ),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'Umur :',
                  ),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'Tanggal Lahir :',
                  ),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'Jenis Kelamin :',
                  ),
                  TextFieldWidget(
                    fillColor: Colors.grey[300].withOpacity(0.8),
                    title: 'No Handphone WA :',
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: PrimaryButton(
                      title: 'Save',
                      onPressed: () {
                        showToast('wip');
                      },
                      color: Colors.black87,
                      fontColor: Colors.white,
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
