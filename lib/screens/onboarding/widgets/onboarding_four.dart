import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            color: kPrimaryColor,
          ),
          Positioned(
            top: getProportionateScreenHeight(365),
            left: getProportionateScreenWidth(34),
            child: AutoSizeText(
              "Organisez et planifiez",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Century Gothic",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(392),
            left: getProportionateScreenWidth(34),
            child: AutoSizeText(
              "de belles rencontres",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Century Gothic",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(445),
            left: getProportionateScreenWidth(34),
            child: AutoSizeText(
              "Lorem ipsum dolor sit amet, consectetur",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "Century Gothic",
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(465),
            left: getProportionateScreenWidth(34),
            child: AutoSizeText(
              "adipiscing elit, sed do eiusmod tempor",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "Century Gothic",
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(62),
            left: getProportionateScreenWidth(13),
            child: Container(
              height: getProportionateScreenHeight(135),
              width: getProportionateScreenWidth(485),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/deux_lignes.png"),
                ),
              ),
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(306),
            top: getProportionateScreenHeight(25),
            child: Container(
              height: getProportionateScreenHeight(230),
              width: getProportionateScreenWidth(215),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/carre_jaune_pencher.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(43),
            left: getProportionateScreenWidth(-105),
            child: Container(
              height: getProportionateScreenHeight(295),
              width: getProportionateScreenWidth(271.36),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/demi_cercle.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(235),
            left: getProportionateScreenWidth(-5),
            child: Container(
              height: getProportionateScreenHeight(85),
              width: getProportionateScreenWidth(70),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/beaucoup_de_point_jaune.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(162),
            left: getProportionateScreenWidth(246),
            child: Container(
              height: getProportionateScreenHeight(314),
              width: getProportionateScreenWidth(314),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/pacman.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(84),
            left: getProportionateScreenWidth(61),
            child: Container(
              height: getProportionateScreenHeight(195),
              width: getProportionateScreenWidth(165),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/triangle_jaune_pencher.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(33),
            left: getProportionateScreenWidth(220),
            child: Container(
              height: getProportionateScreenHeight(155),
              width: getProportionateScreenWidth(135),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/triangle_violet_pencher.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(93),
            left: getProportionateScreenWidth(43),
            child: Container(
              height: getProportionateScreenHeight(138),
              width: getProportionateScreenWidth(128),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/bcp_de_triangle_blanc.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(59),
            left: getProportionateScreenWidth(215),
            child: Container(
              height: getProportionateScreenHeight(36),
              width: getProportionateScreenWidth(43),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage("images/deux_trinagle_rouge.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: getProportionateScreenHeight(61),
              width: getProportionateScreenWidth(155),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/auth");
                    },
                    child: AutoSizeText(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: "Century Gothic",
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
