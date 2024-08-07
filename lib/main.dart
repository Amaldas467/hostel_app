import 'package:flutter/material.dart';
import 'package:hostel_app/screens/homescreen/homescreen_view.dart';
import 'package:hostel_app/screens/signup_page/signup_view.dart';

import 'screens/signin_page/signin_view.dart';
import 'screens/splash_screen/splash_view.dart';
import 'widgets/app_routes.dart';

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
        AppRouter.signUpRoute: (context) => SignUpView(),
        AppRouter.signinRoute: (context) => SignInView(),
        AppRouter.homeRoute: (context) => HomeScreen(),
      },
    );
  }
}
