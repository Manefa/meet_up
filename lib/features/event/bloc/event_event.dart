import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_up/features/event/models/event_model.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class AddEvent extends EventEvent{
  final EventModel eventModel;

  AddEvent({
    @required this.eventModel,
  });

  @override
  List<Object> get props => [eventModel];

  @override
  String toString() => 'AddEvent { event: $eventModel }';
}

class UpdateEvent extends EventEvent{
  final EventModel eventModel;

  UpdateEvent({
    @required this.eventModel,
  });

  @override
  List<Object> get props => [eventModel];

  @override
  String toString() => 'UpdateEvent { event: $eventModel }';
}

class DeleteEvent extends EventEvent{
  final EventModel eventModel;

  DeleteEvent({
    this.eventModel,
  });

  @override
  List<Object> get props => [eventModel];

  @override
  String toString() => 'DeleteEvent { event: $eventModel }';

}

class GetEvents extends EventEvent{
  @override
  List<Object> get props => [];
}