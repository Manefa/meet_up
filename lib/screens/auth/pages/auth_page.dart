import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/size_config.dart';

import '../../../constants.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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

  bool _isHidden = true;

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
                    "Content de vous revoir",
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
                          hintText: kPseudolNullError,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(45),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenWidth(53),
                        width: getProportionateScreenWidth(253),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 21.0, top: 2),
                          child: TextField(
                            obscureText: _isHidden,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 14,
                              fontFamily: "Century Gothic",
                            ),
                            decoration: InputDecoration(
                              hintText: kPassNullError,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: kTextColor,
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(53),
                        width: getProportionateScreenWidth(65),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.lock_outlined,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(34),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/resetpasswordone");
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AutoSizeText(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 14,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(38),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(1),
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(18),
                      ),
                      AutoSizeText(
                        "ou encore",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontFamily: "Century Gothic",
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(18),
                      ),
                      Container(
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(1),
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(38),
                  ),
                  Container(
                    height: getProportionateScreenHeight(53),
                    width: getProportionateScreenWidth(353),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: getProportionateScreenHeight(27),
                            width: getProportionateScreenWidth(27),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image:
                                    new AssetImage("images/logos_facebook.png"),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          AutoSizeText(
                            "Se connecter avec facebook",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 14,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(215),
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
                        "Se connecter",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(29),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      AutoSizeText(
                        "Vous n’avez pas de compte veuillez vous",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(6),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: AutoSizeText(
                          "enregistrer !",
                          style: TextStyle(
                            fontFamily: "Century Gothic",
                            fontSize: 13,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
