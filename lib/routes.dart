import 'package:flutter/material.dart';
import 'package:meet_up/screens/auth/pages/auth_page.dart';
import 'package:meet_up/screens/onboarding/pages/onboarding_page.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_four.dart';
import 'package:meet_up/screens/otp/pages/otp_page.dart';
import 'package:meet_up/screens/register/pages/register_page.dart';
import 'package:meet_up/screens/resetpassword/pages/reset_password_page_one.dart';
import 'package:meet_up/screens/resetpassword/pages/reset_password_page_two.dart';
import 'package:meet_up/screens/splash/splash_page.dart';

var routes = {
  "/": (BuildContext context) => SplashPage(),
  "/onboarding": (BuildContext context) => OnboardingPage(),
  "/getstarted": (BuildContext context) => GetStarted(),
  "/auth": (BuildContext context) => AuthPage(),
  "/register": (BuildContext context) => RegsiterPage(),
  "/otp": (BuildContext context) => OtpPage(),
  "/resetpasswordone": (BuildContext context) => ResetPasswordOne(),
  "/resetpasswordtwo": (BuildContext context) => ResetPasswordTwo(),
};
