import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class StatistikPenilaianWidget extends StatelessWidget {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 16,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 40,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2 - paddingX,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 40,
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
                    fontSize: 10,
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
                fontSize: 6,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              margin: 8,
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
            makeGroupData(0, 15, showTooltips: [0], barColor: Color(0xFF2FFFE6)),
            makeGroupData(0, 20, showTooltips: [0], barColor: Color(0xFFE0FF9F)),
            makeGroupData(0, 25, showTooltips: [0], barColor: Color(0xFFFF7070)),
            makeGroupData(0, 5, showTooltips: [0], barColor: Color(0xFF313131)),
            makeGroupData(0, 15, showTooltips: [0], barColor: Color(0xFFFFC738)),
          ],
        ),
      ),
    );
  }
}
