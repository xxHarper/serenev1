import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:serenev1/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final int x;
  final double toY;
  final result;
  final Color graphColor;

  const MyBarGraph({
    Key? key,
    required this.x,
    required this.toY,
    required this.graphColor,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      bar: result,
    );

    myBarData.initBarData(x);

    return BarChart(
      BarChartData(
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: false,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        maxY: toY,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: graphColor,
                    /* data.y > 70.toDouble()
                        ? Colors.red
                        : data.y > 40.toDouble()
                            ? Colors.yellow
                            : Colors.green, */
                    /* gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.greenAccent,
                        Colors.yellowAccent,
                        Colors.red,
                      ],
                    ), */
                    width: 60,
                    borderRadius: BorderRadius.circular(10),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: toY,
                      color: Colors.grey[200],
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text("BAI");
      break;
    case 1:
      text = const Text("BDI");
      break;
    case 2:
      text = const Text("MINI");
      break;
    default:
      text = const Text("");
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
