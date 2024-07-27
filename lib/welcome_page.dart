import 'package:epingo/auth/ui/login.dart';
import 'package:epingo/auth/ui/sign_up.dart';
import 'package:epingo/widgets/big_blue_button.dart';
import 'package:epingo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const CustomText(text: "e-Shop", size: 22, color: "#0C54BE"),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: SvgPicture.asset("assets/cart2.svg")),
              const SizedBox(height: 8),
              BigBlueButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  }),
              const SizedBox(height: 8),
              BigBlueButton(
                  text: "Signup",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
