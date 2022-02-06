import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
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
            const TitleList(title: "Choose theme"),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ThemeImage(text: "Light", image: "assets/theme/light_theme.png", value: ThemeMode.light),
                  ThemeImage(text: "Dark", image: "assets/theme/dark_theme.png", value: ThemeMode.dark),
                  ThemeImage(text: "System", image: "assets/theme/system_theme.png", value: ThemeMode.system),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DragIndicator extends StatelessWidget {
  const DragIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: darkGrayColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 7,
      width: 50,
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
          Text(text),
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
