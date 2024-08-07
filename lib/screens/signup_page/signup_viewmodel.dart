import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneNController = TextEditingController();
  final userPassController = TextEditingController();

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void signin(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      // Perform registration logic here (e.g., API call)

      // Navigate to another screen upon successful registration
      Navigator.of(context)
          .pushNamed('/home'); // or use AppRouter.homeRoute if defined
    }
  }
}
