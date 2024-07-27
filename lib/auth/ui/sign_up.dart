// ignore_for_file: must_be_immutable

import 'package:epingo/auth/provider/auth_provider.dart';
import 'package:epingo/widgets/big_blue_button.dart';
import 'package:epingo/widgets/custom_text.dart';
import 'package:epingo/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const CustomText(text: "e-Shop", size: 22, color: "#0C54BE"),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                        controller: nameController,
                        hintText: "Name",
                        obscureText: false),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true),
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  authProvider.isLoading
                      ? const CircularProgressIndicator()
                      : BigBlueButton(
                          text: "Signup",
                          onPressed: () {
                            authProvider.signUp(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                              context,
                            );
                          },
                        ),
                  const SizedBox(height: 4),
                  if (authProvider.errorMessage != null)
                    CustomText(
                      text: authProvider.errorMessage!,
                      size: 18,
                      color: "#FF0000",
                    ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Already have an account?",
                        size: 16,
                        color: "",
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Login',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              authProvider.clearErrorMessage();
                              Navigator.pushNamedAndRemoveUntil(
                                context, "/login",
                                (Route<dynamic> route) =>
                                    false, // Remove all previous routes
                              );
                            },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
