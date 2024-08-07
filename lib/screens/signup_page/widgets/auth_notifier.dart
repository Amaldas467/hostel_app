import 'package:flutter/material.dart';

import 'usermodel.dart';

class AuthenticationNotifer extends ChangeNotifier {
  String? _error;
  String? get error => _error;

  Future<bool> signIn({required String email, required String password}) async {
    try {
      // Replace this with your actual sign-in logic (e.g., API call)
      // Simulating a network request for demonstration purposes
      await Future.delayed(Duration(seconds: 2));

      // Example of successful sign-in
      if (email == 'test@example.com' && password == 'password123') {
        _error = null;
        notifyListeners();
        return true;
      } else {
        // Example of failed sign-in
        _error = 'Invalid email or password';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'An error occurred';
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp({required UserModel userModel}) async {
    try {
      // Replace this with your actual sign-up logic (e.g., API call)
      // Simulating a network request for demonstration purposes
      await Future.delayed(Duration(seconds: 2));

      // Example of successful sign-up
      return true;
    } catch (e) {
      _error = 'An error occurred';
      notifyListeners();
      return false;
    }
  }
}
