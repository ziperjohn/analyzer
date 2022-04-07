import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/providers/theme_provider.dart';
import 'package:analyzer_app/widgets/drag_indicator.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            TitleList(title: _locale!.choose_theme),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ThemeImage(
                      text: _locale.light, image: "assets/theme/light_theme.png", value: ThemeMode.light),
                  ThemeImage(text: _locale.dark, image: "assets/theme/dark_theme.png", value: ThemeMode.dark),
                  ThemeImage(
                      text: _locale.system, image: "assets/theme/system_theme.png", value: ThemeMode.system),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeImage extends StatelessWidget {
  final String text;
  final String image;
  final ThemeMode value;

  const ThemeImage({Key? key, required this.text, required this.image, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: () => _themeProvider.setThemeMode(value),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 75,
            height: 157.5,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 5),
          Radio<ThemeMode>(
            value: value,
            groupValue: _themeProvider.themeMode,
            onChanged: (value) => _themeProvider.setThemeMode(value!),
          )
        ],
      ),
    );
  }
}
