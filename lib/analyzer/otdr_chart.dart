import 'package:analyzer_app/analyzer/chart_provider.dart';
import 'package:analyzer_app/analyzer/chart_settings_card.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTDRChart extends StatelessWidget {
  final List<FlSpot> otdrList;

  OTDRChart({Key? key, required this.otdrList}) : super(key: key);

  final List<Color> gradientColors = [primaryColor, secondaryColor];

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _chartProvider = Provider.of<ChartProvider>(context);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(_chartProvider.showAxisX || _chartProvider.showAxisY ? 15 : 5),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: LineChart(
                mainData(context),
              ),
            ),
          ),
        ),
        ChartSettingsCard(
          title: _locale!.show_axis_x,
          value: _chartProvider.showAxisX,
          onChange: (newValue) => _chartProvider.setShowAxisX(newValue),
        ),
        ChartSettingsCard(
          title: _locale.show_axis_y,
          value: _chartProvider.showAxisY,
          onChange: (newValue) => _chartProvider.setShowAxisY(newValue),
        ),
        ChartSettingsCard(
          title: _locale.show_area_under_chart,
          value: _chartProvider.showAreaUnderChart,
          onChange: (newValue) => _chartProvider.setShowAreaUnderChart(newValue),
        ),
        ChartSettingsCard(
          title: _locale.show_grid,
          value: _chartProvider.showGrid,
          onChange: (newValue) => _chartProvider.setShowGrid(newValue),
        ),
        ChartSettingsCard(
          title: _locale.show_dots,
          value: _chartProvider.showDots,
          onChange: (newValue) => _chartProvider.setShowDots(newValue),
        ),
      ],
    );
  }

  LineChartData mainData(BuildContext context) {
    final _chartProvider = Provider.of<ChartProvider>(context);
    final _textTheme = Theme.of(context).textTheme;
    List<FlSpot> data = otdrList;
    return LineChartData(
      lineTouchData: createLineTouchData(context),
      gridData: FlGridData(
        show: _chartProvider.showGrid,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: darkGrayColor,
            strokeWidth: 1,
            dashArray: [5],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: darkGrayColor,
            strokeWidth: 1,
            dashArray: [5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: _chartProvider.showAxisX,
          reservedSize: 20,
          getTextStyles: (context, value) => _textTheme.caption,
        ),
        leftTitles: SideTitles(
          showTitles: _chartProvider.showAxisY,
          reservedSize: 25,
          getTextStyles: (context, value) => _textTheme.caption,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: data.length.toDouble() - 1,
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
            show: _chartProvider.showDots,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 3,
                color: secondaryColor,
                strokeWidth: 0,
                strokeColor: secondaryColor,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: _chartProvider.showAreaUnderChart,
            colors: gradientColors.map((color) => color.withOpacity(0.09)).toList(),
          ),
        ),
      ],
    );
  }

  LineTouchData createLineTouchData(BuildContext context) {
    return LineTouchData(
      getTouchedSpotIndicator: getTouchedSpotIndicator,
      touchTooltipData: LineTouchTooltipData(
        tooltipRoundedRadius: 10,
        maxContentWidth: 160,
        tooltipBgColor: primaryColor,
        getTooltipItems: (touchedBarSpots) => getTooltipItems(context, touchedBarSpots),
      ),
    );
  }

  List<TouchedSpotIndicatorData?> getTouchedSpotIndicator(LineChartBarData barData, List<int> spotIndexes) {
    return spotIndexes.map((index) {
      return TouchedSpotIndicatorData(
        FlLine(
          color: secondaryColor,
        ),
        FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 6,
            color: secondaryColor,
            strokeWidth: 0,
            strokeColor: secondaryColor,
          ),
        ),
      );
    }).toList();
  }

  List<LineTooltipItem?> getTooltipItems(BuildContext context, List<LineBarSpot> touchedBarSpots) {
    final _locale = AppLocalizations.of(context);
    return touchedBarSpots.map(
      (barSpot) {
        final flSpot = barSpot;
        if (flSpot.x == 0 || flSpot.x == 6) {
          return null;
        }
        return LineTooltipItem(
          "${_locale!.distance}: ${flSpot.x.toString()} km\n${_locale.attenuation}: ${flSpot.y.toString()} dB",
          const TextStyle(
            color: whiteColor,
          ),
        );
      },
    ).toList();
  }
}
