import 'package:flutter/material.dart';

import 'package:hostel_app/screens/signup_page/signup_view.dart';
import 'package:hostel_app/screens/signin_page/signin_view.dart';
import 'package:hostel_app/screens/search_screen/search_view.dart';
import 'package:hostel_app/screens/splash_screen/splash_view.dart';

import 'screens/mainscreen/mainscreen.dart';

void main() {
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
      initialRoute: AppRouter.splashRoute,
      routes: {
        AppRouter.splashRoute: (context) => SplashScreenView(),
        AppRouter.mainScreenRoute: (context) => MainScreen(),
        AppRouter.signUpRoute: (context) => SignUpView(),
        AppRouter.signinRoute: (context) => SignInView(),
        AppRouter.searchRoute: (context) => SearchScreen(),
      },
    );
  }
}

class AppRouter {
  static const String splashRoute = '/splash';
  static const String mainScreenRoute = '/main';
  static const String signUpRoute = '/signup';
  static const String signinRoute = '/signin';
  static const String searchRoute = '/search';
}
