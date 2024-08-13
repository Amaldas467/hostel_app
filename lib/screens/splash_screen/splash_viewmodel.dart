import 'package:flutter/material.dart';
import 'package:hostel_app/app/app.router.dart';
import 'package:hostel_app/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    navigationService.replaceWith(Routes.signInView);
    //Navigator.pushReplacementNamed(context, AppRouter.signUpRoute);
  }
}
