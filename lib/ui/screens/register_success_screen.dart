import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/login_screen.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class RegisterSuccessScreen extends StatefulWidget {
  @override
  _RegisterSuccessScreenState createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(Duration(milliseconds: 1500), () {
      Get.off(() => LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: FlareActor('assets/flare/success.flr', animation: 'play'),
            height: sy(200),
          ),
          Text(
            'Register Sukses \nSilahkan login',
            textAlign: TextAlign.center,
            style: GoogleFonts.varelaRound(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
