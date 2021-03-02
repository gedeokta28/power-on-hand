import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/login_screen.dart';
import 'package:power_on_hand/ui/widgets/logo_bareskim.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFDA251D),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(42, 22, 0, 0),
                child: LogoBareskimWidget(),
              ),
              SizedBox(height: sy(12)),
              Padding(
                padding: EdgeInsets.only(right: sy(120)),
                child: Text(
                  'Power',
                  style: GoogleFonts.varelaRound(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: sy(120)),
                child: Text(
                  'On Hand',
                  style: GoogleFonts.varelaRound(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: sy(10)),
              Container(
                width: Get.width,
                height: Get.width,
                padding: EdgeInsets.fromLTRB(0, 70, 30, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: Colors.black,
                ),
                child: Image(image: AssetImage('assets/images/tangan.png')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 14, 50, 14),
                child: PrimaryButton(
                  title: 'LOGIN',
                  fontSize: 24,
                  flex: true,
                  onPressed: () {
                    Get.to(() => LoginScreen());
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
