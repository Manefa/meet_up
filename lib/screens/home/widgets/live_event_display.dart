import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class LiveEventDisplay extends StatefulWidget {
  @override
  _LiveEventDisplayState createState() => _LiveEventDisplayState();
}

class _LiveEventDisplayState extends State<LiveEventDisplay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: getProportionateScreenHeight(165),
            margin: EdgeInsets.only(top: 25, left: 25, right: 25),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.36),
                      spreadRadius: 5,
                      blurRadius: 5,
                    ),
                  ]
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: getProportionateScreenHeight(86),
                            width: getProportionateScreenWidth(86),
                            margin: EdgeInsets.only(top: 23),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0XFFFFE9A5).withOpacity(0.5),
                            ),
                            
                            child: Image.asset("images/resto.png"),
                          ),
                          SizedBox(
                            width: getProportionateScreenHeight(28),
                          ),
                          Column(
                            children: <Widget>[
                              AutoSizeText(
                                  "Fete d’anniversaire",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Century Gothic",
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              AutoSizeText(
                                  "Evenements en cours...",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: "Century Gothic",
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryColor,
                        size: 11,
                      ),
                      SizedBox(width: 5,),
                      AutoSizeText(
                        "Douala,",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: "Century Gothic",
                          fontSize: 9,
                        ),
                      ),
                      SizedBox(width: 3,),
                      AutoSizeText(
                        "Cameroun",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: "Century Gothic",
                          fontSize: 9,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(60),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xFF5A4CB1).withOpacity(0.2),
                        ),
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(109.24),
                        child: Center(
                          child: AutoSizeText(
                            "Rejoindre",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF5A4CB1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
