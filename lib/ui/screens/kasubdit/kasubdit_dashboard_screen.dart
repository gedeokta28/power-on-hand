import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/grafik/grafik_widget.dart';
import 'package:power_on_hand/ui/widgets/grafik/indicator_widget.dart';
import 'package:power_on_hand/ui/widgets/scaffold_three_color_container.dart';

class KasubditDashboardScreen extends StatelessWidget {
  final List<PieChartSectionData> kelaminChartList = [
    PieChartSectionData(
      color: const Color(0xff13d38e),
      value: 30,
      title: '30%',
      radius: sy(65),
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFFCF1F69),
      value: 40,
      title: '40%',
      radius: sy(65),
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xff845bef),
      value: 30,
      title: '30%',
      radius: sy(65),
      titleStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  ];

  final List<Indicator> kelaminIndicatorList = [
    Indicator(
      color: Color(0xff13d38e),
      text: 'Laporan Masuk',
    ),
    Indicator(
      color: Color(0xFFCF1F69),
      text: 'Laporan Terselesaikan',
    ),
    Indicator(
      color: Color(0xff845bef),
      text: 'Laporan Tidak Terselesaikan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldThreeTopCircleContainer(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.alignLeft)),
              Spacer(),
              InkWell(onTap: Get.back, child: Icon(FontAwesomeIcons.solidBell)),
            ],
          ),
          SizedBox(height: sy(16)),
          SizedBox(
            width: Get.width / 1.5,
            child: Text(
              'Hi, Username',
              style: GoogleFonts.varelaRound(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: sy(24)),
          StatistikItemWidget(
            title: 'Statistik Laporan',
            onTapLihat: () {
              showToast('wip');
            },
            chartWidget: GrafikWidget(
              indicatorList: kelaminIndicatorList,
              pieChartList: kelaminChartList,
            ),
          ),
          SizedBox(height: sy(8)),
          StatistikItemWidget(
            title: 'Statistik Penilaian',
            onTapLihat: () {
              showToast('wip');
            },
            chartWidget: StatistikPenilaianWidget(),
          ),
          SizedBox(height: sy(8)),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, sy(8), 0, sy(8)),
              child: Column(
                children: [
                  Text(
                    'Daftar Anggota',
                    style: GoogleFonts.varelaRound(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: sy(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: sy(16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Unit II',
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: sy(16),
                      ),
                    ],
                  ),
                  SizedBox(height: sy(4)),
                  SizedBox(
                    height: sy(140),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        AnggotaItemWidget(),
                        AnggotaItemWidget(),
                        AnggotaItemWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sy(8)),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.fromLTRB(sy(4), sy(8), sy(4), sy(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardMenuItemWidget(title: 'Upload Kasus'),
                  DashboardMenuItemWidget(title: 'Upload LP'),
                  DashboardMenuItemWidget(title: 'Upload Paparan'),
                  DashboardMenuItemWidget(title: 'Aktivitas Anggota'),
                  DashboardMenuItemWidget(title: 'Statistik Penilaian'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashboardMenuItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const DashboardMenuItemWidget({
    Key key,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 5 - sy(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: sy(32),
            height: sy(32),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: sy(4)),
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.varelaRound(
              fontSize: 10,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AnggotaItemWidget extends StatelessWidget {
  const AnggotaItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(sy(4)),
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.lightBlueAccent.shade100, Colors.lightBlueAccent.shade100.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(sy(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sy(12), vertical: sy(8)),
        child: Column(
          children: [
            Icon(
              FontAwesomeIcons.userSecret,
              color: Colors.black,
              size: sy(42),
            ),
            SizedBox(height: sy(12)),
            SizedBox(
              width: sy(60),
              child: Text(
                'Bripka Andrea',
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: sy(6)),
            Container(
              padding: EdgeInsets.all(sy(6)),
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(sy(20)),
              ),
              child: Text(
                'Dinas',
                style: GoogleFonts.varelaRound(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatistikItemWidget extends StatelessWidget {
  final String title;
  final Function onTapLihat;
  final Widget chartWidget;

  const StatistikItemWidget({
    Key key,
    @required this.title,
    @required this.onTapLihat,
    @required this.chartWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(sy(8)),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.varelaRound(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: sy(4)),
            chartWidget,
            FlatButton(
              visualDensity: VisualDensity.compact,
              onPressed: onTapLihat,
              child: Text(
                'Lihat Statistik',
                style: GoogleFonts.varelaRound(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatistikPenilaianWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipBottomMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.y.round().toString(),
                  GoogleFonts.varelaRound(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) => GoogleFonts.varelaRound(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              margin: sy(16),
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'SUBDIT I';
                  case 1:
                    return 'SUBDIT II';
                  case 2:
                    return 'SUBDIT III';
                  case 3:
                    return 'SUBDIT IV';
                  case 4:
                    return 'SUBDIT V';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(y: 8, colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(y: 14, colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(y: 15, colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(y: 13, colors: [Colors.lightBlueAccent, Colors.greenAccent])
              ],
              showingTooltipIndicators: [0],
            ),
          ],
        ),
      ),
    );
  }
}
