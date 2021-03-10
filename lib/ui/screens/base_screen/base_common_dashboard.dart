import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:power_on_hand/core/constant/constant.dart';

class BaseCommonDashboard extends StatelessWidget {
  final List<Widget> children;
  final String name;

  const BaseCommonDashboard({
    Key key,
    @required this.children,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Clippath
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFFC2424), Color(0xFF9D7AFF)],
                    ),
                  ),
                ),
              ),
              // Police Standing Image
              Positioned(
                top: sy(120),
                right: sx(10),
                child: Image(
                  image: AssetImage('assets/images/police_standing.png'),
                  height: sy(400),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.signOutAlt)),
                        Spacer(),
                        InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.ellipsisV)),
                      ],
                    ),
                    SizedBox(height: sy(22)),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        name,
                        style: GoogleFonts.varelaRound(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Chip(
                      backgroundColor: Color(0xFF4DB4FF),
                      visualDensity: VisualDensity.compact,
                      label: Text(
                        'Dinas',
                        style: GoogleFonts.varelaRound(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      labelPadding: EdgeInsets.only(right: 4),
                      avatar: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.circular(180),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
