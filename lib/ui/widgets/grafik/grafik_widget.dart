import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/ui/widgets/grafik/indicator_widget.dart';

class GrafikWidget extends StatelessWidget {
  final List<PieChartSectionData> pieChartList;
  final List<Indicator> indicatorList;

  const GrafikWidget({Key key, this.pieChartList, this.indicatorList}) : super(key: key);
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
                sections: pieChartList),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ...indicatorList,
          ],
        ),
      ],
    );
  }
}
