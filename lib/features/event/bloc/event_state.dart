import 'package:equatable/equatable.dart';
import 'package:meet_up/features/event/models/event_model.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class EventInitial extends EventState {
  @override
  List<Object> get props => [];
}

class AddEventState extends EventState{
  @override
  List<Object> get props => [];
}

class UpdateEventState extends EventState{
  @override
  List<Object> get props => [];
}

class DeleteEventState extends EventState{
  @override
  List<Object> get props => [];
}

class GetEventState extends EventState{
  final List<EventModel> events;

  GetEventState({
    this.events,
});
  @override
  List<Object> get props => [events];
}

class GetEventErrorState extends EventState{
  final String message;

  GetEventErrorState({
    this.message,
  });
  @override
  List<Object> get props => [message];
}

class AddEventErrorState extends EventState{
  final String message;

  AddEventErrorState({
    this.message,
  });
  @override
  List<Object> get props => [message];
}



