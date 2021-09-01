import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_up/features/event/bloc/bloc.dart';
import 'package:meet_up/features/event/models/event_model.dart';
import 'package:meet_up/features/event/repository/event_repository.dart';

const String GETEVENTSERRORNODATA = "Get Event Error no Data";
const String GETEVENTSERRORCATCH = "Get Event Error Catch";
const String ADDEVENTSERROR = "Add Event Error";

class EventBloc extends Bloc<EventEvent, EventState> {

  final _eventRepository = EventRepository();

  EventBloc({@required EventRepository eventRepository})
      : assert(eventRepository != null),  super(EventInitial());

  @override
  Stream<EventState> mapEventToState(
    EventEvent event,
  ) async* {
    if (event is GetEvents) {
      yield* _mapGetEventsToState();
    } else if (event is AddEvent) {
      yield* _mapAddEventToState(event);
    } else if (event is UpdateEvent) {
      yield* _mapUpdateEventToState(event);
    } else if (event is DeleteEvent) {
      yield* _mapDeleteEventToState(event);
    }
  }


  Stream<EventState>_mapGetEventsToState() async*{
    List<EventModel> events = new List<EventModel>.empty();
    try{
      await for (List<EventModel> events in _eventRepository.getEvent1()) {
        if(events.length == 0){
          print(events.length.toString()+"1");
          yield GetEventErrorState(message: GETEVENTSERRORNODATA);
        }else{
          print(events.length.toString()+"2");
          yield GetEventState(events: events);
        }
      }
    }catch(e){
      print(events.length.toString()+"31");
      yield GetEventErrorState(message: GETEVENTSERRORCATCH);
    }
  }

  Stream<EventState> _mapAddEventToState(AddEvent event) async* {
    try{
      _eventRepository.addEvent(event.eventModel);
      yield AddEventState();
    }catch(e){
      yield AddEventErrorState(message: ADDEVENTSERROR);
    }
  }

  _mapUpdateEventToState(UpdateEvent event) {}

  _mapDeleteEventToState(DeleteEvent event) {}

}

