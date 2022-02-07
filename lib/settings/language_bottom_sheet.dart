import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/localization/localization_provider.dart';
import 'package:analyzer_app/widgets/drag_indicator.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localizationProvider = Provider.of<LocalizationProvider>(context);
    final _textTheme = Theme.of(context).textTheme;
    final _locale = AppLocalizations.of(context);
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: DragIndicator(),
            ),
            const SizedBox(height: 10),
            TitleList(title: _locale!.choose_language),
            const SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  title: Text(_locale.english, style: _textTheme.headline5),
                  onTap: () => _localizationProvider.setLocale(const Locale("en")),
                ),
                ListTile(
                  title: Text(_locale.czech, style: _textTheme.headline5),
                  onTap: () => _localizationProvider.setLocale(const Locale("cs")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
