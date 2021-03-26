import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/screens/login_screen.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class ForgetSuccessScreen extends StatefulWidget {
  @override
  _ForgetSuccessScreenState createState() => _ForgetSuccessScreenState();
}

class _ForgetSuccessScreenState extends State<ForgetSuccessScreen> {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: sy(150)),
          SizedBox(
            child: FlareActor('assets/flare/success.flr', animation: 'play'),
            height: sy(200),
          ),
          Text(
            'Forget Password Sukses \nSilahkan Cek Email',
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
