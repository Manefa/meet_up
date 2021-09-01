import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/features/event/entities/event_entity.dart';
import 'package:meta/meta.dart';

@immutable
class EventModel {
  final String id;
  final String image;
  final String titre;
  final String description;
  final DateTime date;
  final String time;
  final String location;
  final int color;

  EventModel({
    @required this.id,
    @required this.image,
    @required this.titre,
    @required this.description,
    @required this.date,
    @required this.time,
    @required this.location,
    @required this.color,
});


  EventModel copyWith({String image, String titre, String description, DateTime date, String time, String location, int color}) {
    return EventModel(
      id: id ?? this.id,
      image: image ?? this.image,
      titre: image ?? this.titre,
      description: image ?? this.description,
      date: image ?? this.date,
      time: image ?? this.time,
      location: image ?? this.location,
      color: image ?? this.color,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ image.hashCode ^ titre.hashCode ^ description.hashCode ^ date.hashCode ^ time.hashCode ^ location.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EventModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              image == other.image &&
              titre == other.titre &&
              description == other.description &&
              date == other.date &&
              time == other.time &&
              location == other.location &&
              color == other.color;

  @override
  String toString() {
    return 'Todo {is: $id, image: $image, titre: $titre, description: $description, date: $date, time: $time, location: $location, color: $color}';
  }

  EventEntity toEntity() {
    return EventEntity(id: id, image: image, titre: titre, description: description, date: Timestamp.fromDate(date), time: time, location: location, color: color);
  }

  static EventModel fromEntity(EventEntity entity) {
    return EventModel(
      id: entity.id,
      image: entity.image,
      titre: entity.titre,
      description: entity.description,
      date: DateTime.parse(entity.date.toDate().toString()),
      time: entity.time,
      location: entity.location,
      color: entity.color,
    );
  }
}