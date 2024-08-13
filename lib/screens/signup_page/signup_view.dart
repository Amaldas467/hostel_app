import 'package:flutter/material.dart';
import 'package:hostel_app/app/app.router.dart';
import 'package:hostel_app/app/utils.dart';
import 'package:stacked/stacked.dart';

import '../../constants/colorconstants.dart';
import '../../widgets/app_routes.dart';
import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
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
                color: Colors.white,
              ),
            ),
          ),
          body: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mirage,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Create a new account to get started.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Form(
                              key: viewModel.formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Username',
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: viewModel.userNameController,
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter a username'
                                        : null,
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: viewModel.userEmailController,
                                    validator: (val) =>
                                        val!.isEmpty ? 'Enter an Email' : null,
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Mobile No',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    controller: viewModel.userPhoneNController,
                                    validator: (val) =>
                                        val!.isEmpty || val.length < 10
                                            ? 'Enter a Mobile'
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
                                          viewModel.togglePasswordVisibility();
                                        },
                                      ),
                                    ),
                                    obscureText: viewModel.obscurePassword,
                                    controller: viewModel.userPassController,
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter a password'
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.signin(context);
                          navigationService.navigateTo(Routes.signInView);
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.mirage,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Navigator.of(context)
                              //    .pushNamed(AppRouter.signinRoute);
                              navigationService.navigateTo(Routes.signInView);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
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
