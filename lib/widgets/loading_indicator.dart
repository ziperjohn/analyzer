import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircularProgressIndicator(
          strokeWidth: 7,
        ),
      ),
    );
  }
}
