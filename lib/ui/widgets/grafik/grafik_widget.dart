import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:power_on_hand/ui/widgets/grafik/indicator_widget.dart';

class GrafikWidget extends StatelessWidget {
  final List<PieChartSectionData> pieChartList;
  final List<Indicator> indicatorList;

  const GrafikWidget({Key key, this.pieChartList, this.indicatorList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8),
            AspectRatio(
              aspectRatio: 0.8,
              child: PieChart(
                PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                    sections: pieChartList),
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...indicatorList,
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
