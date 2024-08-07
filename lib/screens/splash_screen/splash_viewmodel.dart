import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_routes.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, AppRouter.signUpRoute);
  }
}
