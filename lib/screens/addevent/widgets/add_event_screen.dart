import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meet_up/core/uploadimage/upload_event_image.dart';
import 'package:meet_up/features/event/bloc/bloc.dart';
import 'package:meet_up/features/event/entities/item.dart';
import 'package:meet_up/features/event/models/event_model.dart';
import 'package:meet_up/screens/addevent/widgets/text_filed_datepicker.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

int selectColor;

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController titleinput = TextEditingController();
  TextEditingController descriptioninput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController localisationinput = TextEditingController();
  DateTime _dateTime;
  TimeOfDay _timeOfDay;
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );
  File _image;
  var imagePicker;
  static EventBloc _eventBloc;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    Future.delayed(Duration.zero, () {
      initializeDateFormatting('en');
      timeinput.text = TimeOfDay.now().format(context).toString();
      imagePicker = new ImagePicker();
    });
    _eventBloc = BlocProvider.of<EventBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return BlocListener(
      bloc: _eventBloc,
      listener: (BuildContext context, EventState state) {
        if(state is AddEventErrorState){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Error...'), Icon(Icons.error, color: Colors.white,)],
                ),
              ),
            );
        }if(state is AddEventState){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Evenement Ajouter'), Icon(Icons.check, color: Colors.white,)],
                ),
              ),
            );
        }
      },

      child: BlocBuilder(
        bloc: _eventBloc,
      builder: (BuildContext context, EventState state){
          return SingleChildScrollView(
            child: Container(
              width: size.width,
              color: Colors.white,
              padding: EdgeInsets.only(left: 40, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(14),),
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
                      SizedBox(width: getProportionateScreenWidth(30),),
                      AutoSizeText(
                        "Creer un evenement",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Century Gothic",
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(35),),
                  GestureDetector(
                    onTap: () async {
                      XFile image = await imagePicker.pickImage(
                        source: ImageSource.gallery,);
                      setState(() {
                        _image = File(image.path);
                      });
                      print('object');
                    },
                    child: Container(
                      height: getProportionateScreenHeight(284),
                      width: size.width,
                      child: Stack(
                        children: <Widget>[
                          _image != null
                              ? Image.file(
                            _image,
                            width: getProportionateScreenWidth(310),
                            height: getProportionateScreenHeight(250),
                            fit: BoxFit.fitHeight,
                          )
                              : Container(
                            height: getProportionateScreenHeight(250),
                            width: getProportionateScreenWidth(310),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0XFF68E1FD),
                            ),
                            child: Center(
                              child: Image.asset(
                                "images/basket.png",
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: getProportionateScreenHeight(4),
                            right: getProportionateScreenWidth(35),
                            child: Container(
                              height: getProportionateScreenHeight(66),
                              width: getProportionateScreenWidth(66),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: kPrimaryColor,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 34,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(28),),
                  AutoSizeText(
                    "Titre de l'evenement",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: getProportionateScreenHeight(7),),
                  Container(
                    height: getProportionateScreenWidth(53),
                    width: getProportionateScreenWidth(321),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: TextFormField(
                        controller: titleinput,
                        textAlignVertical: TextAlignVertical.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: false,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 12,
                          fontFamily: "Century Gothic",
                        ),
                        decoration: InputDecoration(
                          hintText: "Allez jouer au basket",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: kTextColor,
                              fontSize: 12,
                              fontFamily: "Century Gothic"
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  AutoSizeText(
                    "Description de l'evenement",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: getProportionateScreenHeight(7),),
                  Container(
                    height: getProportionateScreenWidth(96),
                    width: getProportionateScreenWidth(320),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: TextFormField(
                        controller: descriptioninput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 5,
                        autocorrect: false,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                          fontFamily: "Century Gothic",
                        ),
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                              " Vitae, nulla consectetur sollicitudin fames. Venenatis turpis"
                              " risus nunc eu semper vulputate leo diam. Habitant semper viverra"
                              " dignissim vulputate elementum pretium, turpis sollicitudin."
                              " Consequat adipiscing pharetra turpis.",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: kTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            "Date",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                            ),),
                          SizedBox(height: getProportionateScreenHeight(7),),
                          Container(
                            height: getProportionateScreenWidth(53),
                            width: getProportionateScreenWidth(150),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MyTextFieldDatePicker(
                              prefixIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.date_range,
                                color: Colors.grey,
                                size: 20,
                              ),
                              lastDate: DateTime.now().add(Duration(days: 366)),
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              onDateChanged: (selectedDate) {
                                dateinput.text = selectedDate.toString();
                                _dateTime = selectedDate;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(22),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            "Time",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Century Gothic",
                              fontWeight: FontWeight.bold,
                            ),),
                          SizedBox(height: getProportionateScreenHeight(7),),
                          Container(
                            height: getProportionateScreenWidth(53),
                            width: getProportionateScreenWidth(150),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: timeinput,
                              textAlignVertical: TextAlignVertical.center,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              autocorrect: false,
                              readOnly: true,  //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay time = TimeOfDay.now();
                                FocusScope.of(context).requestFocus(new FocusNode());
                                TimeOfDay picked =
                                await showTimePicker(
                                  context: context,
                                  initialTime: time,
                                  builder: (context, child){
                                    return Theme(data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: kPrimaryColor,
                                      ),
                                    ), child: child);
                                  },
                                );
                                if (true) {
                                  timeinput.text = picked.format(context).toString();
                                  _timeOfDay = picked;// add this line.
                                  setState(() {
                                    time = picked;
                                  });
                                }
                              },
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 12,
                                fontFamily: "Century Gothic",
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: timeinput.text,
                                suffixIcon: Icon(
                                  Icons.access_time_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: kTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  AutoSizeText(
                    "Localisation",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: getProportionateScreenHeight(7),),
                  Container(
                    height: getProportionateScreenWidth(53),
                    width: getProportionateScreenWidth(321),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21.0),
                      child: TextFormField(
                        controller: localisationinput,
                        textAlignVertical: TextAlignVertical.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: false,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                          fontFamily: "Century Gothic",
                        ),
                        decoration: InputDecoration(
                          hintText: "Douala, Cameroun",
                          suffixIcon: Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                            size: 24,
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: kTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  AutoSizeText(
                    "Choissisez une couleur",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  /*
                  AutoSizeText(
                    "Ajouter des personnes",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Century Gothic",
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: getProportionateScreenHeight(7),),
                  Row(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: new AssetImage("images/avatar1.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: new AssetImage("images/avatar2.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          "images/avatar3.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Container(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          "images/avatar4.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      FDottedLine(
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(50),
                        strokeWidth: 2.0,
                        dottedLength: 5.0,
                        space: 3.0,
                        corner: FDottedLineCorner.all(8),
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.add_rounded,
                            color: kPrimaryColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),*/
                  Container(
                    height: getProportionateScreenHeight(50),
                    child: ColorDisplay(),
                  ),
                  SizedBox(height: getProportionateScreenHeight(48),),
                  Container(
                    height: getProportionateScreenHeight(53),
                    width: getProportionateScreenWidth(146),
                    margin: EdgeInsets.only(left: 86),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                    ),
                    child: TextButton(
                      child: AutoSizeText(
                        "Enregistrer",
                        style: TextStyle(
                          fontFamily: "Century Gothic",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        String image = await uploadFile(_image);
                        EventModel eventModel = EventModel(id: "1", image: image, titre: titleinput.text, description: descriptioninput.text, date: _dateTime, time: _timeOfDay.format(context).toString(), location: localisationinput.text, color: selectColor);
                        _eventBloc.add(
                          AddEvent(eventModel: eventModel),
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
                        });
                      },
                    ),
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


Item item1 = Item(9884384, false);
Item item2 = Item(14788452, false);
Item item3 = Item(9406650, false);
Item item4 = Item(14771300, false);
Item item5 = Item(14802020, false);
bool selectOther;

class ColorDisplay extends StatefulWidget {
  @override
  _ColorDisplayState createState() => _ColorDisplayState();
}

class _ColorDisplayState extends State<ColorDisplay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Item> items = [item1, item2, item3, item4, item5];
    return Container(
      color: Colors.white,
      width: size.width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              items.forEach((element) => element.selected = false);
              setState(() {
                items[index].selected ? items[index].selected = false : items[index].selected = true;
              });
              selectColor = items[index].color;
            },
            child: items[index].selected ?
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10) ,
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(50),
                  decoration:  BoxDecoration(
                    color: Color(items[index].color).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 10,
                  bottom: 0,
                  child: Icon(
                    Icons.check,
                    color: kPrimaryColor,
                  ),
                )
              ],
            )

                : Container(
              margin: EdgeInsets.only(left: 10) ,
              height: getProportionateScreenHeight(25),
              width: getProportionateScreenWidth(50),
              decoration:  BoxDecoration(
                color:Color(items[index].color).withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}

