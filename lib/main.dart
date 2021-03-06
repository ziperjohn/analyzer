import 'package:analyzer_app/providers/providers.dart';
import 'package:analyzer_app/services/services.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/localization/l10n.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/theme/theme.dart';
import 'package:analyzer_app/navigation/routes.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init local data from phone
  await UserSharedPreferences.init();
  await PackageInfoService.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Init Firebase app
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
          // Send error to Firebase crashlytics
          FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LocalizationProvider()),
              ChangeNotifierProvider(create: (_) => ThemeProvider()),
              ChangeNotifierProvider(create: (_) => NavigationProvider()),
              ChangeNotifierProvider(create: (_) => ChartProvider()),
              StreamProvider<List<AnalyzerModel>>(
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
      },
    );
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
