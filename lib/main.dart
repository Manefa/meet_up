import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/core/utils/simple_bloc_delegate.dart';
import 'package:meet_up/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }
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
