import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostel_app/app/app.router.dart';

import 'package:stacked_services/stacked_services.dart';

import 'widgets/setup_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //if (!kIsWeb) {
  //  if (Platform.isAndroid) {
  //    ByteData data = await PlatformAssetBundle().load(
  //      Assets.ca.letsEncryptR3,
  //    );
  //    SecurityContext.defaultContext.setTrustedCertificatesBytes(
  //      data.buffer.asUint8List(),
  //    );
  //  }
  //}
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorObservers: [
        StackedService.routeObserver,
        //Statusbarz.instance.observer,
        //FlutterSmartDialog.observer
      ],
    );
  }
}
