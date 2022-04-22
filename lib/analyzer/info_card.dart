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
            CardRow(title: "${_locale.fiber_id}:", value: info.fiberID),
            CardRow(title: "${_locale.wavelength}:", value: info.wavelength),
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
        const Divider(),
      ],
    );
  }
}
