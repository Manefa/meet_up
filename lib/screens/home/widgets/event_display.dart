import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/features/event/models/event_model.dart';

import '../../../size_config.dart';

EventModel item1 = new EventModel(
    id: "1",
    image: "images/basket.png",
    titre: "Jouer au Basket",
    description: "lorem ipsum",
    date: DateTime.now(),
    time: TimeOfDay.now().toString(),
    location: "Douala, Cameroun",
    color: 9884384,
);


EventModel item2 = new EventModel(
  id: "2",
  image: "images/hip_hop.png",
  titre: "Dance HIP-HOP",
  description: "lorem ipsum",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  location: "Douala, Cameroun",
  color: 14788452,
);

EventModel item3 = new EventModel(
  id: "3",
  image: "images/Gaming.png",
  titre: "Gaming",
  description: "lorem ipsum",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  location: "Douala, Cameroun",
  color: 	9406650,
);

EventModel item4 = new EventModel(
  id: "4",
  image: "images/run.png",
  titre: "Randonner",
  description: "lorem ipsum",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  location: "Douala, Cameroun",
  color: 	14771300,
);

EventModel item5 = new EventModel(
  id: "5",
  image: "images/resto.png",
  titre: "Allons au resto",
  description: "lorem ipsum",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  location: "Douala, Cameroun",
  color: 	14802020,
);

EventModel item6 = new EventModel(
  id: "6",
  image: "images/date.png",
  titre: "Rendez-vous",
  description: "lorem ipsum",
  date: DateTime.now(),
  time: TimeOfDay.now().toString(),
  location: "Douala, Cameroun",
  color: 	14771390,
);

class EventDisplay extends StatefulWidget {
  final List<EventModel> events;

  const EventDisplay({Key key, this.events}) : super(key: key);
  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    //List<EventModel> items = [item1, item2, item3, item4, item5, item6];
    //List<EventModel> allEvents = widget.events + items;
    initializeDateFormatting();
    return InkWell(
        onTap: (){
          print(widget.events.length.toString());
          Navigator.pushNamed(context, "/joinevent");
        },
      child: Container(
        height: getProportionateScreenHeight(378),
        padding: EdgeInsets.only(top: 4, bottom: 8),
        width: size.width,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.only(right: 25),
          physics: BouncingScrollPhysics(),
          itemCount: widget.events.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 25, top: 10),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(199),
                        width: getProportionateScreenWidth(246),
                        decoration: BoxDecoration(
                          color: Color(widget.events[index].color).withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.36),
                              spreadRadius: 5,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Center(
                          child: Container(
                            height: getProportionateScreenHeight(150),
                            width: getProportionateScreenWidth(150),
                            child: Image.network(
                              widget.events[index].image,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(139),
                        width: getProportionateScreenWidth(246),
                        padding: EdgeInsets.only(left: 18, top: 10, right: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.36),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,2),
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              DateFormat('yMMMEd', 'fr').format(widget.events[index].date),
                              style: TextStyle(
                                fontFamily: "Century Gothic",
                                fontSize: 9,
                                color: kTextColor,
                              ),
                            ),
                            SizedBox(height: 6,),
                            AutoSizeText(
                              widget.events[index].titre,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6,),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on_outlined,
                                  color: kPrimaryColor,
                                  size: 11,
                                ),
                                SizedBox(width: 9,),
                                AutoSizeText(
                                  widget.events[index].location,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: "Century Gothic",
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.red,
                                          ),
                                          height: getProportionateScreenHeight(25),
                                          width: getProportionateScreenWidth(25),
                                        ),
                                      ),
                                      Positioned(
                                        left: getProportionateScreenHeight(15),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.black,
                                          ),
                                          height: getProportionateScreenHeight(25),
                                          width: getProportionateScreenWidth(25),
                                        ),
                                      ),
                                      Positioned(
                                        left: getProportionateScreenHeight(30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.amber,
                                          ),
                                          height: getProportionateScreenHeight(25),
                                          width: getProportionateScreenWidth(25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(6),
                                       color: Color(0xFF5A4CB1).withOpacity(0.2),
                                     ),
                                    height: getProportionateScreenHeight(28),
                                    width: getProportionateScreenWidth(96),
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
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
              ),
            );
          },
        ),
      ),
    );
  }
}
