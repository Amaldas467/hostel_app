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
      Navigator.of(context).pushNamed('/home');
    }
  }
}
