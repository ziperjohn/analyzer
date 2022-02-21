import 'package:analyzer_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OTDRChart extends StatelessWidget {
  OTDRChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [primaryColor, secondaryColor];

  final data = const [
    FlSpot(0, 20),
    FlSpot(1, 18),
    FlSpot(2, 17),
    FlSpot(3, 16),
    FlSpot(4, 19),
    FlSpot(5, 15),
    FlSpot(6, 14),
    FlSpot(7, 12),
    FlSpot(8, 12.8),
    FlSpot(9, 12),
    FlSpot(10, 11),
    FlSpot(11, 12),
    FlSpot(12, 10),
    FlSpot(13, 9),
    FlSpot(14, 8),
    FlSpot(15, 7),
    FlSpot(16, 7.6),
    FlSpot(17, 6),
    FlSpot(18, 17),
    FlSpot(19, 3),
    FlSpot(20, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 15, 5),
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: createLineTouchData(),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(showTitles: true),
        leftTitles: SideTitles(showTitles: true),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: 20,
      lineBarsData: [
        LineChartBarData(
          spots: data,
          isCurved: false,
          colors: gradientColors,
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.09)).toList(),
          ),
        ),
      ],
    );
  }

  LineTouchData createLineTouchData() {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: darkSurfaceColor,
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
}
