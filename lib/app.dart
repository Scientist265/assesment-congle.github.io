import '/export.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Movable Square Dock View",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal.withOpacity(0.3),

        primarySwatch: Colors.grey,
      ),
      home: const WelcomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
