import 'package:flutter/material.dart';
import 'package:food_manager/Constants/app_constants.dart';
import 'package:food_manager/Utilities/app_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
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
                "Login",
                style: utils.xxLargeHeadingTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Alle Informationen ausfüllen",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
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
                hintText: "Passwort",
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, forgotEmailScreenRoute);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Passwort vergessen?",
                    style: utils.smallTitleTextStyle(
                      color: Colors.red,
                    ),
                  ),
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
                  Navigator.pushNamed(context, bottomNavigationBarScreenRoute);
                },
                text: "Login",
                fontSize: 18.0,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, signUpScreenRoute);
                },
                child: Text(
                  "Noch nicht registriert? Hier Registrieren",
                  style: utils.smallTitleTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 1,
                    color: blueColor,
                  ),
                  Text(
                    "Login mit",
                    style: utils.smallTitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 1,
                    color: blueColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 2; i++)
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              i == 0
                                  ? "assets/google.png"
                                  : "assets/facebook.png",
                              scale: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          i == 0 ? "Google" : "Facebook",
                          style: utils.smallTitleTextStyle(
                            color: blueColor,
                          ),
                        )
                      ],
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
