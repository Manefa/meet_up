import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class RegsiterPage extends StatefulWidget {
  RegsiterPage({Key key}) : super(key: key);

  @override
  _RegsiterPageState createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
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
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                      "Créer un nouveau compte",
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
                      height: getProportionateScreenHeight(45),
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
                            hintText: kPhoneNumberNullError,
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
                      height: 26,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              _value = !_value;
                            });
                          },
                          child: Container(
                            height: getProportionateScreenHeight(32),
                            width: getProportionateScreenWidth(32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _value ? kSecondaryColor : kPrimaryColor,
                            ),
                            child: _value
                                ? Icon(
                                    Icons.check,
                                    size: 16.0,
                                    color: kSecondaryColor,
                                  )
                                : Icon(
                                    Icons.check,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(15),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AutoSizeText(
                                  "J'accepte les  ",
                                  style: TextStyle(
                                    fontFamily: "Century Gothic",
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                AutoSizeText(
                                  "conditions d'utilisation",
                                  style: TextStyle(
                                    fontFamily: "Century Gothic",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                AutoSizeText(
                                  " et la",
                                  style: TextStyle(
                                    fontFamily: "Century Gothic",
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            AutoSizeText(
                              "politique de confidentialité",
                              style: TextStyle(
                                fontFamily: "Century Gothic",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(130),
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
                          "S’enregistrer",
                          style: TextStyle(
                            fontFamily: "Century Gothic",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/otp");
                        },
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
                          "Vous avez deja un compte veuillez vous",
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
                            Navigator.pushNamed(context, "/auth");
                          },
                          child: AutoSizeText(
                            "connecter !",
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
