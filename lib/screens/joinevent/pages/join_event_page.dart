import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class JoinEventPage extends StatefulWidget {
  @override
  _JoinEventPageState createState() => _JoinEventPageState();
}

class _JoinEventPageState extends State<JoinEventPage> {
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
            padding: const EdgeInsets.only(left: 34, right: 34),
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
                      SizedBox(width: getProportionateScreenWidth(35),),
                      AutoSizeText(
                        "Rejoindre l’evenement",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Century Gothic",
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(110),
                        width: getProportionateScreenWidth(110),
                        child: Image.asset("images/fille_chinoise.png"),
                      ),
                      SizedBox(width: getProportionateScreenWidth(25),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            "Jane Doe",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(8),),
                          AutoSizeText(
                            "UI/UX Designer",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                              color: kTextColor
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(8),),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: kPrimaryColor,
                                size: 14,
                              ),
                              AutoSizeText(
                                "Douala,",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Century Gothic",
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(2),),
                              AutoSizeText(
                                "Cameroun",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Century Gothic",
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Container(
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(68),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "Follow",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              fontFamily: "Century Gothic",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30),),
                  Row(
                    children: <Widget>[
                      SizedBox(width: getProportionateScreenWidth(15),),
                      Column(
                        children: <Widget>[
                          AutoSizeText(
                            "08",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(7),),
                          AutoSizeText(
                            "Evenements creer",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 12,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(37),),
                      Column(
                        children: <Widget>[
                          AutoSizeText(
                            "12",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(7),),
                          AutoSizeText(
                            "Evenemets rejoint",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 12,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(37),),
                      Column(
                        children: <Widget>[
                          AutoSizeText(
                            "200",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(7),),
                          AutoSizeText(
                            "Follower",
                            style: TextStyle(
                              fontFamily: "Century Gothic",
                              fontSize: 12,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  AutoSizeText(
                    "Photo de l'evenement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  Container(
                    height: getProportionateScreenHeight(199),
                    width: getProportionateScreenWidth(246),
                    decoration: BoxDecoration(
                      color: Color(0XFF68E1FD).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      "images/basket.png",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  AutoSizeText(
                    "Jouer au Basket",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(8),),
                  AutoSizeText(
                    "Samedi le 5 juillet, 2020",
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: "Century Gothic",
                      color: kTextColor
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  AutoSizeText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa pellentesque semper neque, quis dolor amet praesent velit aliquet.Pharetra semper ut cursus suspendisse eros, imperdiet ac at arcu. Vel turpis tincidunt vestibulum, maecenas. Et vestibulum orci nunc dolor a. Viverra.",
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      fontSize: 9,
                      color: kTextColor,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30),),
                  InkWell(
                    onTap: (){
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            duration: Duration(seconds:  3),
                            backgroundColor: Colors.green,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('Vous avez rejoint cette evenement'), Icon(Icons.check, color: Colors.white,)],
                            ),
                          ),
                        );
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: getProportionateScreenWidth(85),),
                        Container(
                          height: getProportionateScreenHeight(50),
                          width: getProportionateScreenWidth(176),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: AutoSizeText(
                              "Rejoindre",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold
                              ),
                            ),
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
