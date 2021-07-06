import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ResetPasswordOne extends StatefulWidget {
  ResetPasswordOne({Key key}) : super(key: key);

  @override
  _ResetPasswordOneState createState() => _ResetPasswordOneState();
}

class _ResetPasswordOneState extends State<ResetPasswordOne> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
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
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(51),
                  ),
                  AutoSizeText(
                    "Réinitialiser le mot de passe",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  AutoSizeText(
                    "Lorem ipsum dolor sit amet, consectetur",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 16,
                      color: kTextColor,
                    ),
                  ),
                  AutoSizeText(
                    "adipiscing elit, sed do eiusmod tempor",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 16,
                      color: kTextColor,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(49),
                  ),
                  Container(
                    height: getProportionateScreenWidth(53),
                    width: getProportionateScreenWidth(353),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: TextField(
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                          fontFamily: "Century Gothic",
                        ),
                        decoration: InputDecoration(
                          hintText: kEmailNullError,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(500),
                  ),
                  Container(
                    height: getProportionateScreenHeight(53),
                    width: getProportionateScreenWidth(353),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                    ),
                    child: TextButton(
                      child: AutoSizeText(
                        "Envoyer les instructions",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/resetpasswordtwo");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
