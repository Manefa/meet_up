import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/event/bloc/bloc.dart';
import 'package:meet_up/features/event/repository/event_repository.dart';
import 'package:meet_up/screens/addevent/widgets/add_event_screen.dart';

import '../../../size_config.dart';

class AddEventPage extends StatefulWidget {

  final EventRepository _eventRepository = new EventRepository();

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  EventBloc _eventBloc;
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    _eventBloc = EventBloc(
      eventRepository: widget._eventRepository,
    );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<EventBloc>(
          create: (BuildContext context) => _eventBloc,
          child: AddEventScreen(),
        ),
      ),
    );
  }
}
