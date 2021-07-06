import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_four.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_one.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_three.dart';
import 'package:meet_up/screens/onboarding/widgets/onboarding_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: kPrimaryColor,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: PageView(
          pageSnapping: true,
          children: <Widget>[
            OnboardingOne(),
            OnboardingTwo(),
            OnboardingThree(),
            GetStarted(),
          ],
        ),
      ),
    );
  }
}
