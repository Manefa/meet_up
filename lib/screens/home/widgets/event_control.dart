import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up/features/event/bloc/bloc.dart';

class EventControls extends StatefulWidget {
  const EventControls({
    Key key,
  }) : super(key: key);

  @override
  _EventControlsState createState() => _EventControlsState();
}

class _EventControlsState extends State<EventControls> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventBloc>(context).add(GetEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
