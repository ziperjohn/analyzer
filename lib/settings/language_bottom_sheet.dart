import 'package:analyzer_app/widgets/drag_indicator.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
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
            const TitleList(title: "Choose language"),
            const SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  title: Text("🇺🇸 English", style: _textTheme.headline5),
                ),
                ListTile(
                  title: Text("🇨🇿 Czech", style: _textTheme.headline5),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
