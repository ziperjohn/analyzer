import 'package:analyzer/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainChart extends StatelessWidget {
  MainChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [primaryColor, secondaryColor];

  final data = const [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
    FlSpot(12, 1),
    FlSpot(14, 2),
    FlSpot(15, 4),
    FlSpot(16, 5),
    FlSpot(17, 8),
    FlSpot(20, 12),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        mainData(),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
        lineTouchData: createLineTouchData(),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return createLine();
          },
          getDrawingVerticalLine: (value) {
            return createLine();
          },
        ),
        titlesData: FlTitlesData(
          show: false,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(show: true, border: Border.all(color: darkGrayColor, width: 1)),
        minX: 0,
        maxX: 20,
        minY: 0,
        maxY: 15,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: false,
            colors: gradientColors,
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors.map((color) => color.withOpacity(0.2)).toList(),
            ),
          ),
        ],
        axisTitleData: FlAxisTitleData(
          leftTitle: createAxisTitle("Power [dB]"),
          bottomTitle: createAxisTitle("Distance [Km]"),
        ));
  }

  LineTouchData createLineTouchData() {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: surfaceColor,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map(
            (barSpot) {
              final flSpot = barSpot;
              if (flSpot.x == 0 || flSpot.x == 6) {
                return null;
              }
              return LineTooltipItem(
                "x: ${flSpot.x.toString()} km\ny: ${flSpot.y.toString()} dB",
                const TextStyle(
                  color: lightGrayColor,
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }

  AxisTitle createAxisTitle(String title) {
    return AxisTitle(
      showTitle: true,
      margin: 4,
      titleText: title,
      textStyle: const TextStyle(
        color: lightGrayColor,
        fontSize: 15,
      ),
    );
  }

  FlLine createLine() {
    return FlLine(
      color: darkGrayColor,
      strokeWidth: 0.5,
    );
  }
}
