import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Container(
              height: getProportionateScreenHeight(392),
              width: getProportionateScreenWidth(390),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage("images/Party_Monochromatic.png"),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(26),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      AutoSizeText(
                        "Organisez et planifiez",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Century Gothic",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AutoSizeText(
                        "de belles rencontres",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Century Gothic",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      AutoSizeText(
                        "Lorem ipsum dolor sit amet, consectetur",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Century Gothic",
                        ),
                      ),
                      AutoSizeText(
                        "adipiscing elit, sed do eiusmod tempor",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Century Gothic",
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/getstarted");
                            },
                            child: AutoSizeText(
                              "Get Start",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 8.18,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(41),
                      ),
                      Container(
                        color: Colors.white,
                        height: 1,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(47),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: size.width / 4,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: getProportionateScreenHeight(16),
                                  width: getProportionateScreenWidth(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(13),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(16),
                                  width: getProportionateScreenWidth(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFADA6D8),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(13),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(16),
                                  width: getProportionateScreenWidth(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFADA6D8),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/auth");
                            },
                            child: AutoSizeText(
                              "Skip",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Century Gothic",
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
          ],
        ),
      ),
    );
  }
}
