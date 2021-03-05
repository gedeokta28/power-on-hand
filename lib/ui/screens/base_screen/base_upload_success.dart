import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';

class BaseUploadSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: Get.back,
                  child: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black87),
                ),
              ),
              SizedBox(height: sy(24)),
              Image(
                image: AssetImage('assets/images/bird_mail.png'),
                width: Get.width,
              ),
              SizedBox(height: sy(64)),
              SizedBox(
                width: Get.width - paddingX * 2,
                child: Text(
                  'Laporan Terkirim',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: sy(12)),
              Text(
                'Terimakasih :) Selamat Beraktifitas',
                style: GoogleFonts.varelaRound(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: sy(32)),
              SizedBox(
                width: Get.width / 2,
                child: PrimaryButton(
                  title: 'Okay',
                  color: Colors.black87,
                  fontColor: Colors.white,
                  flex: true,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
