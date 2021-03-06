import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoCard extends StatelessWidget {
  final InfoModel info;

  const InfoCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CardTitle(title: _locale!.general),
            CardRow(title: "${_locale.fiber_id}:", value: info.fiberType),
            CardRow(title: "${_locale.wavelength}:", value: info.wavelength),
            CardRow(title: "${_locale.pulse_width}:", value: info.pulseWidth),
            CardRow(title: "${_locale.sample_spacing}:", value: info.sampleSpacing),
            CardRow(title: "${_locale.index}:", value: info.index),
            CardRow(title: "${_locale.bc}:", value: info.bc),
            const SmallSpacer(),
            CardTitle(title: _locale.threshold),
            CardRow(title: "${_locale.loss_threshold}:", value: info.lossThr),
            CardRow(title: "${_locale.reflection_threshold}:", value: info.reflThr),
            CardRow(title: "${_locale.eot_threshold}:", value: info.eotThr),
            const SmallSpacer(),
            CardTitle(title: _locale.loss),
            CardRow(title: "${_locale.start}:", value: "${info.lossStart} dB"),
            CardRow(title: "${_locale.finish}:", value: "${info.lossEnd} dB"),
            CardRow(title: "${_locale.total}:", value: "${info.totalLoss} dB"),
            const SmallSpacer(),
            CardTitle(title: _locale.orl),
            CardRow(title: "${_locale.start}:", value: "${info.orlStart} dB"),
            CardRow(title: "${_locale.finish}:", value: "${info.orlFinish} dB"),
            CardRow(title: "${_locale.total}:", value: "${info.orl} dB"),
          ],
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String title;

  const CardTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2),
        const CustomDivider(),
      ],
    );
  }
}
