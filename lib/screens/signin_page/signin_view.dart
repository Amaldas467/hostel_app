import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/colorconstants.dart';
import 'signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.creamColor,
          appBar: AppBar(
            backgroundColor: AppColors.mirage,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 24,
                color: AppColors.creamColor,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 120),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mirage,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Log in to your account.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.mirage,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Form(
                                key: viewModel.formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: viewModel.emailController,
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter an Email'
                                          : null,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            viewModel.obscurePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            viewModel
                                                .togglePasswordVisibility();
                                          },
                                        ),
                                      ),
                                      obscureText: viewModel.obscurePassword,
                                      controller: viewModel.passwordController,
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter a password'
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.signIn(context);
                                    Navigator.of(context).pushNamed('/main');
                                  },
                                  child: Text('Sign In'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColors.creamColor,
                                    backgroundColor: AppColors.mirage,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      color: AppColors.mirage,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/sign-up');
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
