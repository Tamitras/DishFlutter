import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController2 = TextEditingController();
  var emailController = TextEditingController();
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(
                "assets/donut.png",
                scale: 4,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Register Now",
                style: utils.xxLargeHeadingTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Get Advantages!",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              utils.textField(
                controller: nameController,
                hintText: "Name",
                isObscure: false,
                prefixIcon: Image.asset(
                  "assets/profileIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.textField(
                controller: emailController,
                hintText: "Email",
                isObscure: false,
                prefixIcon: Image.asset(
                  "assets/emailIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.textField(
                controller: passwordController,
                hintText: "Password",
                isObscure: true,
                prefixIcon: Image.asset(
                  "assets/passwordIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.textField(
                controller: passwordController2,
                hintText: "Re Type Password",
                isObscure: true,
                prefixIcon: Image.asset(
                  "assets/passwordIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.bigButton(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                borderRadius: 10.0,
                containerColor: blueColor,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginScreenRoute, (route) => false);
                },
                text: "Register",
                fontSize: 18.0,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, loginScreenRoute);
                },
                child: Text(
                  "Already have an account? Log in",
                  style: utils.smallTitleTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
