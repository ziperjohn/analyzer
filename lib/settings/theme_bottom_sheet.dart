import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              color: darkGrayColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: 8,
            width: 40,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ThemeImage(
                text: "Light",
                image: "light",
                value: ThemeMode.light,
              ),
              ThemeImage(text: "Dark", image: "dark", value: ThemeMode.dark),
              ThemeImage(text: "System", image: "system", value: ThemeMode.system),
            ],
          )
        ],
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
    final _theme = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Container(
          height: 215,
          width: 100,
          color: Colors.cyan,
        ),
        const SizedBox(height: 20),
        Text(text),
        const SizedBox(height: 20),
        Radio<ThemeMode>(
          value: value,
          groupValue: _theme.themeMode,
          onChanged: (ThemeMode? newTheme) {
            _theme.setThemeMode(newTheme!);
          },
        )
      ],
    );
  }
}
