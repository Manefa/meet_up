import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Container(
              width: size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: getProportionateScreenHeight(39),
                          width: getProportionateScreenWidth(39),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.36),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(130),),
                      AutoSizeText(
                        "Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Century Gothic",
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(42),),
                  AutoSizeText(
                    "Location",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 15,
                            ),
                            AutoSizeText(
                              "Localisation courante",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(26),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: kPrimaryColor,
                              size: 15,
                            ),
                            AutoSizeText(
                              "Rechercher une loca...",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 10,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(42),),
                  AutoSizeText(
                    "Date",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "Aujourd'hui",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Century Gothic",
                              fontSize: 14,
                              color: kPrimaryColor
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(26),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                          child: Center(
                            child: AutoSizeText(
                              "Demain",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Century Gothic",
                                  fontSize: 14,
                                  color: kPrimaryColor
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(165),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.date_range_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                         AutoSizeText(
                            "Choisir une date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Century Gothic",
                                fontSize: 10,
                                color: Colors.white
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(42),),
                  AutoSizeText(
                    "Heure",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "09:00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Century Gothic",
                                fontSize: 14,
                                color: kPrimaryColor
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(26),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "12:00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Century Gothic",
                                fontSize: 14,
                                color: kPrimaryColor
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "15:00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Century Gothic",
                                fontSize: 14,
                                color: kPrimaryColor
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(26),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(165),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "18:00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Century Gothic",
                                fontSize: 14,
                                color: kPrimaryColor
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(18),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(165),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.white,
                        ),
                        AutoSizeText(
                          "Choisir une heure",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Century Gothic",
                              fontSize: 10,
                              color: Colors.white
                          ),
                        ),
                      ],
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
