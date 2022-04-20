import 'package:analyzer_app/analyzer/analyzer.dart';
import 'package:analyzer_app/providers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTDRChartSettings extends StatelessWidget {
  const OTDRChartSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _chartProvider = Provider.of<ChartProvider>(context);
    return Column(
      children: [
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
}
