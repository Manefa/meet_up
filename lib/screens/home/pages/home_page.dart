import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/features/event/bloc/bloc.dart';
import 'package:meet_up/features/event/repository/event_repository.dart';
import 'package:meet_up/screens/home/widgets/event_control.dart';
import 'package:meet_up/screens/home/widgets/event_display.dart';
import 'package:meet_up/screens/home/widgets/live_event_display.dart';

import '../../../size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Color(0XFF5A4CB1),
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
      final _eventRepository = new EventRepository();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return BlocProvider(
      create: (context) => EventBloc(eventRepository: _eventRepository),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenHeight(289.02),
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: getProportionateScreenHeight(1),
                          left: getProportionateScreenWidth(-100),
                          child: Container(
                            height: getProportionateScreenHeight(585),
                            width: getProportionateScreenWidth(585),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: new AssetImage("images/cercle_gris.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: getProportionateScreenHeight(-50),
                          left: getProportionateScreenWidth(164),
                          child: Container(
                            height: getProportionateScreenHeight(500),
                            width: getProportionateScreenWidth(500),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: new AssetImage("images/cercle_blue.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: getProportionateScreenHeight(45),
                          left: getProportionateScreenWidth(-130),
                          child: Container(
                            height: getProportionateScreenHeight(500),
                            width: getProportionateScreenWidth(500),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: new AssetImage("images/cercle_violet.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: getProportionateScreenHeight(260),
                          child: Container(
                            height: getProportionateScreenHeight(636),
                            width: getProportionateScreenWidth(414),
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: getProportionateScreenHeight(231),
                          left: getProportionateScreenWidth(25),
                          child: Container(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(366),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: getProportionateScreenWidth(15),),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                SizedBox(width: getProportionateScreenWidth(18),),
                                Container(
                                  height: getProportionateScreenHeight(50),
                                  width: getProportionateScreenWidth(200),
                                  child: TextFormField(
                                    autofocus: false,
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Century Gothic",
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Rechercher un evenement",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: kTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: getProportionateScreenWidth(50),),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/filter");
                                  },
                                  child: Container(
                                    height: getProportionateScreenHeight(39),
                                    width: getProportionateScreenWidth(39),
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.filter_list_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: getProportionateScreenWidth(25),
                          top: getProportionateScreenHeight(130),
                          child: AutoSizeText(
                            "Trouver des",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: getProportionateScreenWidth(25),
                          top: getProportionateScreenHeight(157),
                          child: AutoSizeText(
                            "Evénements tendances",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: getProportionateScreenHeight(40),
                          left: getProportionateScreenWidth(25),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/addevent");
                            },
                            child: Container(
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: getProportionateScreenHeight(40),
                          right: getProportionateScreenWidth(25),
                          child: Container(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              "images/fille_cheveux_violet.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Row(
                    children: <Widget>[
                      SizedBox(width: getProportionateScreenWidth(25),),
                      Container(
                        child: AutoSizeText(
                          "Evenements Populaires",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Century Gothic",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  BlocBuilder<EventBloc, EventState>(
                    builder: (context, state) {
                      if(state is GetEventState){
                        return Container(
                          child: EventDisplay(events: state.events,),
                        );
                      }else if(state is GetEventErrorState){
                        return Container(
                          child: Text(state.message),
                        );
                      }
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: getProportionateScreenWidth(25),),
                      Container(
                        child: AutoSizeText(
                          "Evenements en cours",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Century Gothic",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: LiveEventDisplay(),
                  ),
                  EventControls(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
