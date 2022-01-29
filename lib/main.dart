import 'package:analyzer/providers/navigation_provider.dart';
import 'package:analyzer/theme/theme.dart';
import 'package:analyzer/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Analyzer",
      routes: appRoutes,
      darkTheme: darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}
