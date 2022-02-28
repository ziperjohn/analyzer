import 'package:analyzer_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OTDRChart extends StatelessWidget {
  final List<FlSpot> otdrList;

  OTDRChart({Key? key, required this.otdrList}) : super(key: key);

  final List<Color> gradientColors = [primaryColor, secondaryColor];

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
    List<FlSpot> data = otdrList;
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
        leftTitles: SideTitles(showTitles: true, reservedSize: 30),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 20,
      minY: -50,
      maxY: 0,
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
