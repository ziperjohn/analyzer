import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PulsingIcon extends StatefulWidget {
  const PulsingIcon({Key? key}) : super(key: key);

  @override
  State<PulsingIcon> createState() => _PulsingIconState();
}

class _PulsingIconState extends State<PulsingIcon> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true, min: 0.5, max: 1);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Icon(FontAwesomeIcons.exclamation, color: redColor, size: 120),
    );
  }
}
