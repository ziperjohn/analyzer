// ignore_for_file: implementation_imports

import 'package:analyzer/providers/navigation_provider.dart';
import 'package:analyzer/screens/chart_screen.dart';
import 'package:analyzer/screens/home_screen.dart';
import 'package:analyzer/screens/settings_screen.dart';
import 'package:analyzer/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const ChartScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      body: screens[context.watch<NavigationProvider>().screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.read<NavigationProvider>().setScreenIndex(index),
        currentIndex: context.watch<NavigationProvider>().screenIndex,
        backgroundColor: surfaceColor,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(label: "Chart", icon: Icon(FontAwesomeIcons.chartLine)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(FontAwesomeIcons.userCog)),
        ],
      ),
    );
  }
}
