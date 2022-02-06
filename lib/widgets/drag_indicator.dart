import 'package:flutter/material.dart';

import '../theme/colors.dart';

class DragIndicator extends StatelessWidget {
  const DragIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: lightGrayColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 7,
      width: 50,
    );
  }
}
