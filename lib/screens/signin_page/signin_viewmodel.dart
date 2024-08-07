import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

import '../signup_page/widgets/auth_notifier.dart';

class SignInViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  GlobalKey<FormState> get formKey => _formKey;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      bool isValid =
          await Provider.of<AuthenticationNotifer>(context, listen: false)
              .signIn(email: email, password: password);
      if (isValid) {
        Navigator.of(context)
            .pushReplacementNamed('/home'); // Adjust to your actual route
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sign In Successful"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        var errorType =
            Provider.of<AuthenticationNotifer>(context, listen: false).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorType ?? "Unknown error"),
            backgroundColor: Colors.red.shade200,
          ),
        );
      }
    }
  }
}
