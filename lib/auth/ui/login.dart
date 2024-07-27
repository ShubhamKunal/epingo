// ignore_for_file: must_be_immutable

import 'package:epingo/auth/provider/auth_provider.dart';
import 'package:epingo/widgets/big_blue_button.dart';
import 'package:epingo/widgets/custom_text.dart';
import 'package:epingo/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (authProvider.errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15.0), // Curved corners
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 239, 169, 169)
                                .withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: const Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: CustomText(
                          text: authProvider.errorMessage!,
                          size: 14,
                          color: "#FF0000"),
                    ),
                  const SizedBox(height: 22),
                  authProvider.isLoading
                      ? const CircularProgressIndicator()
                      : BigBlueButton(
                          text: "Login",
                          onPressed: () {
                            authProvider.login(emailController.text,
                                passwordController.text, context);
                          },
                        ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "New here?",
                        size: 16,
                        color: "",
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Signup',
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
                                context,
                                "/signup",
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
