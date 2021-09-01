import 'package:flutter/material.dart';
import 'package:meet_up/screens/addevent/pages/add_event_page.dart';
import 'package:meet_up/screens/auth/pages/auth_page.dart';
import 'package:meet_up/screens/filter/pages/filter.dart';
import 'package:meet_up/screens/home/pages/home_page.dart';
import 'package:meet_up/screens/joinevent/pages/join_event_page.dart';
import 'package:meet_up/screens/onboarding/pages/onboarding_page.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_four.dart';
import 'package:meet_up/screens/otp/pages/otp_page.dart';
import 'package:meet_up/screens/register/pages/register_page.dart';
import 'package:meet_up/screens/resetpassword/pages/reset_password_page_one.dart';
import 'package:meet_up/screens/resetpassword/widgets/reset_password_screen_one.dart';
import 'package:meet_up/screens/resetpassword/widgets/reset_password_screen_two.dart';
import 'package:meet_up/screens/splash/splash_page.dart';

var routes = {
  "/": (BuildContext context) => SplashPage(),
  "/onboarding": (BuildContext context) => OnboardingPage(),
  "/getstarted": (BuildContext context) => GetStarted(),
  "/auth": (BuildContext context) => AuthPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/otp": (BuildContext context) => OtpPage(),
  "/resetpasswordpageone": (BuildContext context) => ResetPasswordPageOne(),
  "/resetpasswordone": (BuildContext context) => ResetPasswordScreenOne(),
  "/resetpasswordtwo": (BuildContext context) => ResetPasswordScreenTwo(),
  "/homepage": (BuildContext context) => HomePage(),
  "/addevent": (BuildContext context) => AddEventPage(),
  "/filter": (BuildContext context) => Filter(),
  "/joinevent": (BuildContext context) => JoinEventPage(),
};
