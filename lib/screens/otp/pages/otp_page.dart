import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/screens/otp/widgets/textfieldotp_page.dart';

import '../../../size_config.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);

  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(OtpPage.overlayStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: getProportionateScreenHeight(119),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: getProportionateScreenHeight(160),
                        width: getProportionateScreenWidth(160),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xFFF5F5FB),
                        ),
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenHeight(30),
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30),
                      bottom: getProportionateScreenHeight(30),
                      child: Container(
                        height: getProportionateScreenHeight(95),
                        width: getProportionateScreenWidth(95),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("images/majesticons_mail.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(34),
                ),
                AutoSizeText(
                  "Verifiez vos Messages",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(34),
                ),
                AutoSizeText(
                  "nous vous avons envoyé un code afin de",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                AutoSizeText(
                  "confirmer votre identiter veuillez le saisir",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(34),
                ),
                Container(
                  height: getProportionateScreenHeight(53),
                  width: getProportionateScreenWidth(176),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryColor,
                  ),
                  child: TextButton(
                    child: AutoSizeText(
                      "Ouvrir votre messagerie",
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
                  height: getProportionateScreenHeight(73),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    "Changer de numero",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(13),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: getProportionateScreenWidth(53),
                      width: getProportionateScreenWidth(190),
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
                            hintText: "694539834",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(60),
                    ),
                    Container(
                      height: getProportionateScreenHeight(53),
                      width: getProportionateScreenWidth(94),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image:
                              AssetImage("images/ic_sharp-change-circle.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(70),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextfieldotpPage(first: true, last: false),
                    TextfieldotpPage(first: false, last: false),
                    TextfieldotpPage(first: false, last: false),
                    TextfieldotpPage(first: false, last: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
