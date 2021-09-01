import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/size_config.dart';

import '../../../constants.dart';

class ResetPasswordScreenTwo extends StatefulWidget {
  ResetPasswordScreenTwo({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenTwoState createState() => _ResetPasswordScreenTwoState();
}

class _ResetPasswordScreenTwoState extends State<ResetPasswordScreenTwo> {
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: getProportionateScreenHeight(106),
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
                  "Verifiez vos emails",
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
                  "nous avons envoyé des instructions de ",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                AutoSizeText(
                  "récupération de mot de passe à votre adresse",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                AutoSizeText(
                  "e-mail",
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
                      "Ouvrir votre boite mail",
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
                  height: getProportionateScreenHeight(34),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/auth");
                  },
                  child: AutoSizeText(
                    "Retourner a la page de connection",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(202),
                ),
                AutoSizeText(
                  "Vous n’avez pas recu d’email ? Regarder dans vos Spam",
                  style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/resetpasswordpageone");
                  },
                  child: AutoSizeText(
                    "Ou essayez avec une autre adresse email",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
