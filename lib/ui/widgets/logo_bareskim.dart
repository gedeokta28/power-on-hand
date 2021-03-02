import 'package:flutter/material.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class LogoBareskimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/logo_bareskrim.png'),
      height: sy(60),
    );
  }
}
