import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:power_on_hand/core/controllers/statistik_controller.dart';
import 'package:random_color/random_color.dart';

class KasubditStatistikPenilaianBottomSheet extends StatefulWidget {
  @override
  _KasubditStatistikPenilaianBottomSheetState createState() => _KasubditStatistikPenilaianBottomSheetState();
}

class _KasubditStatistikPenilaianBottomSheetState extends State<KasubditStatistikPenilaianBottomSheet> {
  DateTime choosenDate;

  @override
  void initState() {
    super.initState();
    choosenDate = DateTime.now();
    StatistikController.to.getStatistikChart(choosenDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 70,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 36,
              height: 4,
              margin: EdgeInsets.all(8),
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
                onTap: () {
                  setState(() {
                    choosenDate = choosenDate.subtract(Duration(days: 1));
                  });
                  StatistikController.to.getStatistikChart(choosenDate);
                },
                child: Icon(
                  FontAwesomeIcons.longArrowAltLeft,
                  color: Colors.blue.shade600,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  DateFormat('dd-MMM-y').format(choosenDate).toString(),
                  style: GoogleFonts.varelaRound(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    choosenDate = choosenDate.add(Duration(days: 1));
                  });
                  StatistikController.to.getStatistikChart(choosenDate);
                },
                child: Icon(
                  FontAwesomeIcons.longArrowAltRight,
                  color: Colors.blue.shade600,
                ),
              ),
            ],
          ),
          GetBuilder<StatistikController>(
            initState: (_) {},
            builder: (_) {
              return Wrap(
                runSpacing: 12,
                spacing: 12,
                children: _.listStatistik == null || _.isLoading
                    ? [Center(child: CircularProgressIndicator())]
                    : _.listStatistik
                        .map((statistik) {
                          // if(UserController.to.user.title == 'anggota'){
                          //   if(statistik.name = "")
                          // }
                          return GrafikPercentWidget(
                            title: statistik.name,
                            percentage: statistik.percentange,
                          );
                        })
                        .toList()
                        .cast<Widget>(),
              );
            },
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
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CircularPercentIndicator(
        radius: Get.width / 3.3,
        lineWidth: 20,
        animation: true,
        animationDuration: 1000,
        percent: percentage / 100,
        center: Text(
          "$percentage%",
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        footer: Text(
          title,
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.bold,
            fontSize: 14,
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
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.all(6),
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
