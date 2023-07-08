import 'package:flutter/material.dart';
import 'package:food_manager/Constants/app_constants.dart';
import 'package:food_manager/Utilities/app_utils.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Food Management",
                        style: utils.largeTitleBoldTextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/donut.png",
                          scale: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Get Registered! Get Perks!",
            style: utils.mediumTitleBoldTextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Unlimited creation of dishes! 🍔",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "List all your favorite dishes! 🍭",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Share them with your friends! 🍟",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Push notifications about dishes that have not been cooked for a long time",
                  style: utils.smallTitleTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          utils.bigButton(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50.0,
            borderRadius: 10.0,
            containerColor: blueColor,
            onTap: () {
              Navigator.pushNamed(context, loginScreenRoute);
            },
            text: "Get Started",
            fontSize: 18.0,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
