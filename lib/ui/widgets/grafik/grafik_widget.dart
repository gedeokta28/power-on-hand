import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/models/chart/report_model.dart';
import 'package:power_on_hand/ui/widgets/grafik/indicator_widget.dart';

class GrafikWidget extends StatelessWidget {
  final List<ReportModel> listReport;
  GrafikWidget({
    Key key,
    @required this.listReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: 160,
          width: Get.width / 2 - paddingX,
          child: PieChart(
            PieChartData(
              borderData: FlBorderData(
                show: false,
              ),
              startDegreeOffset: 180,
              sectionsSpace: 1,
              centerSpaceRadius: 0,
              sections: [
                PieChartSectionData(
                  color: const Color(0xff13d38e),
                  value: listReport[0].laporanMasuk.toDouble(),
                  title: '${listReport[0].laporanMasuk}%',
                  radius: 65,
                  titleStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: const Color(0xFFCF1F69),
                  value: listReport[1].laporanTerselesaikan.toDouble(),
                  title: '${listReport[1].laporanTerselesaikan}%',
                  radius: 65,
                  titleStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: const Color(0xff845bef),
                  value: listReport[2].laporanTidakTerselesaikan.toDouble(),
                  title: '${listReport[2].laporanTidakTerselesaikan}%',
                  radius: 65,
                  titleStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ],
    );
  }
}
