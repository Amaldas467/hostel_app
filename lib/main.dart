import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:hostel_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'screens/favouritescreen/widgets/favourite_provider.dart';
import 'widgets/setup_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteProvider(), // Provide FavoriteProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorObservers: [
          StackedService.routeObserver,
          // Statusbarz.instance.observer,
          // FlutterSmartDialog.observer
        ],
      ),
    );
  }
}
