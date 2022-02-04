import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/providers/navigation_provider.dart';
import 'package:analyzer_app/services/firestore_service.dart';
import 'package:analyzer_app/theme/theme.dart';
import 'package:analyzer_app/utils/routes.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
            return ErrorScreen(
              errorMessage: snapshot.error.toString(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => NavigationProvider()),
                StreamProvider<List<Analyzer>>(
                    create: (_) => FirestoreService().analyzers,
                    initialData: const [])
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Analyzer",
                routes: appRoutes,
                darkTheme: darkMode,
                themeMode: ThemeMode.dark,
              ),
            );
          } else {
            return const LoadingScreen();
          }
        });
  }
}

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkMode,
      themeMode: ThemeMode.dark,
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
    return MaterialApp(
      darkTheme: darkMode,
      themeMode: ThemeMode.dark,
      home: const Scaffold(
        body: Center(child: LoadingIndicator()),
      ),
    );
  }
}
