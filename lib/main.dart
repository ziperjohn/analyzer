import 'package:analyzer_app/localization/localization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/localization/l10n.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/navigation/navigation_provider.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/theme.dart';
import 'package:analyzer_app/theme/theme_provider.dart';
import 'package:analyzer_app/utils/routes.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
              child: ErrorScreen(
                errorMessage: snapshot.error.toString(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => LocalizationProvider()),
                ChangeNotifierProvider(create: (_) => ThemeProvider()),
                ChangeNotifierProvider(create: (_) => NavigationProvider()),
                StreamProvider<List<Analyzer>>(
                    create: (_) => FirestoreService().analyzerListStream(), initialData: const [])
              ],
              child: const MatterialAppWithTheme(),
            );
          } else {
            return ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
              child: const LoadingScreen(),
            );
          }
        });
  }
}

class MatterialAppWithTheme extends StatelessWidget {
  const MatterialAppWithTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localizationProvider = Provider.of<LocalizationProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Analyzer",
      routes: appRoutes,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeProvider.themeMode,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: _localizationProvider.locale,
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeProvider.themeMode,
      home: Scaffold(
        body: Center(child: Text(errorMessage)),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeProvider.themeMode,
      home: const Scaffold(
        body: Center(child: LoadingIndicator()),
      ),
    );
  }
}
