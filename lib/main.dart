import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Authentication/forgot_email_screen.dart';
import 'Authentication/landing_screen.dart';
import 'Authentication/login_screen.dart';
import 'Authentication/new_password_screen.dart';
import 'Authentication/otp_screen.dart';
import 'Authentication/sign_up_screen.dart';
import 'Authentication/splash_screen.dart';
import 'Constants/app_constants.dart';
import 'HomeScreens/bottom_navigation_bar_screen.dart';
import 'HomeScreens/edit_recipe_screen.dart';
import 'HomeScreens/all_recipe_screen.dart';
import 'HomeScreens/food_details_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashScreen(),
        landingScreenRoute: (context) => const LandingScreen(),
        loginScreenRoute: (context) => const LoginScreen(),
        foodDetailsScreenRoute: (context) => const FoodDetailsScreen(),
        editRecipeScreenRoute: (context) => const EditRecipeScreen(),
        allRecipeScreenRoute: (context) => const AllRecipeScreen(),
        bottomNavigationBarScreenRoute: (context) =>
            const BottomNavigationBarScreen(),
        signUpScreenRoute: (context) => const SignUpScreen(),
        forgotEmailScreenRoute: (context) => const ForgotEmailScreen(),
        newPasswordScreenRoute: (context) => const NewPasswordScreen(),
        otpScreenRoute: (context) => const OtpScreen(),
      },
    );
  }
}
