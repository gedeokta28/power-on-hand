import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:random_color/random_color.dart';

class KanitStatistikPenilaianBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - sy(70),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: sy(36),
              height: sy(4),
              margin: EdgeInsets.all(sy(8)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: Get.back,
                child: Icon(
                  FontAwesomeIcons.longArrowAltLeft,
                  color: Colors.blue.shade600,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(sy(8)),
                child: Text(
                  'Senin, 01-02-2021',
                  style: GoogleFonts.varelaRound(
                    fontSize: sy(12),
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: Get.back,
                child: Icon(
                  FontAwesomeIcons.longArrowAltRight,
                  color: Colors.blue.shade600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GrafikPercentWidget(
                title: '23 Laporan Masuk',
                percentage: 75,
              ),
              GrafikPercentWidget(
                title: '7 Laporan Terkirim',
                percentage: 40,
              ),
            ],
          ),
          SizedBox(height: sy(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GrafikPercentWidget(
                title: '11 Kasus Masuk',
                percentage: 25,
              ),
              GrafikPercentWidget(
                title: '5 Kasus Dikirim',
                percentage: 90,
              ),
            ],
          ),
          SizedBox(height: sy(12)),
          PointWidget(
            text: 'Point',
            textChip: '25',
          ),
        ],
      ),
    );
  }
}

class GrafikPercentWidget extends StatelessWidget {
  final String title;
  final int percentage;
  final RandomColor _randomColor = RandomColor();

  GrafikPercentWidget({Key key, this.title, this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sy(12)),
      margin: EdgeInsets.all(sy(4)),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CircularPercentIndicator(
        radius: Get.width / 3.3,
        lineWidth: sy(14),
        animation: true,
        animationDuration: 1000,
        percent: percentage / 100,
        center: Text(
          "$percentage%",
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.bold,
            fontSize: sy(16),
            color: Colors.blue,
          ),
        ),
        footer: Text(
          title,
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.bold,
            fontSize: sy(12),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: _randomColor.randomColor(
          colorSaturation: ColorSaturation.highSaturation,
          colorBrightness: ColorBrightness.primary,
        ),
      ),
    );
  }
}

class PointWidget extends StatelessWidget {
  final String text;
  final String textChip;

  const PointWidget({
    Key key,
    @required this.text,
    @required this.textChip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(sy(8)),
          padding: EdgeInsets.symmetric(vertical: sy(4), horizontal: sy(8)),
          decoration: BoxDecoration(
            color: Colors.red[300],
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.1,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: sy(6)),
              Container(
                padding: EdgeInsets.all(sy(6)),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  textChip,
                  style: GoogleFonts.varelaRound(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
