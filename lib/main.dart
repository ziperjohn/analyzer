import 'package:analyzer_app/providers/analyzer_provider.dart';
import 'package:analyzer_app/providers/navigation_provider.dart';
import 'package:analyzer_app/theme/theme.dart';
import 'package:analyzer_app/utils/routes.dart';
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

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

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
