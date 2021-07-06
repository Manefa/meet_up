import 'package:flutter/material.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meet Up',
      debugShowCheckedModeBanner: false,
      color: kPrimaryColor,
      initialRoute: "/",
      routes: routes,
    );
  }
}
