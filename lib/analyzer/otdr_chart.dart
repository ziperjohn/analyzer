import 'package:analyzer_app/analyzer/analyzer.dart';
import 'package:analyzer_app/models/event_model.dart';
import 'package:analyzer_app/models/info_model.dart';
import 'package:analyzer_app/providers/providers.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTDRChart extends StatelessWidget {
  final List<FlSpot> pointList;
  final List<EventModel> eventList;
  final InfoModel info;

  const OTDRChart({Key? key, required this.pointList, required this.eventList, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _chartProvider = Provider.of<ChartProvider>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(_chartProvider.showAxisX || _chartProvider.showAxisY ? 15 : 5),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: pointList.isEmpty
                  ? const NoDataWidget()
                  : LineChart(
                      mainData(context),
                    ),
            ),
            pointList.isEmpty
                ? Container()
                : ThirdButton(
                    text: _locale!.show_details,
                    action: () => navigateToOtdrDetailsScreen(context, eventList, info),
                    icon: Icons.assignment_rounded),
          ],
        ),
      ),
    );
  }

  void navigateToOtdrDetailsScreen(BuildContext context, List<EventModel> eventList, InfoModel info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => OTDRDetailsScreen(
          eventList: eventList,
          info: info,
        ),
      ),
    );
  }

  LineChartData mainData(BuildContext context) {
    final _chartProvider = Provider.of<ChartProvider>(context);
    final _textTheme = Theme.of(context).textTheme;

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
      maxX: info.maxX.toDouble(),
      minY: info.minY.toDouble(),
      maxY: info.maxY.toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: pointList,
          isCurved: false,
          colors: chartGradient,
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: _chartProvider.showDots,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 2,
                color: secondaryColor,
                strokeWidth: 0,
                strokeColor: secondaryColor,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: _chartProvider.showAreaUnderChart,
            colors: chartGradient.map((color) => color.withOpacity(0.09)).toList(),
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
            fontSize: 13,
          ),
          textAlign: TextAlign.left,
        );
      },
    ).toList();
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.show_chart_rounded,
          size: 80,
        ),
        Text(
          _locale!.select_port_prompt,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
