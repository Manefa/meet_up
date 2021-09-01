import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventEntity extends Equatable{
  final String id;
  final String image;
  final String titre;
  final String description;
  final Timestamp date;
  final String time;
  final String location;
  final int color;

  EventEntity({
    @required this.id,
    @required this.image,
    @required this.titre,
    @required this.description,
    @required this.date,
    @required this.time,
    @required this.location,
    @required this.color,
});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'titre': titre,
      'description': description,
      'date': date,
      'time': time,
      'location': location,
      'color': color,
    };
  }

  static EventEntity fromJson(Map<String, Object> json) {
    return EventEntity(
      id: json['id'] as String,
      image: json['image'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String,
      date: json['date'] as Timestamp,
      time: json['time'] as String,
      location: json['location'] as String,
      color: json['color'] as int,
    );
  }

  static EventEntity fromSnapshot(DocumentSnapshot snap) {
    return EventEntity(
      id: snap.get('id'),
      image: snap.get('image'),
      titre: snap.get('titre'),
      description: snap.get('description'),
      date: snap.get('date'),
      time: snap.get('time'),
      location: snap.get('location'),
      color: snap.get('color'),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'image': image,
      'titre': titre,
      'description': description,
      'date': date,
      'time': time,
      'location': location,
      'color': color,
    };
  }

  @override
  String toString() {
    return 'Event {id: $id, image: $image, titre: $titre, description: $description, date: $date, time: $time,  location: $location, color: $color}';
  }

  @override
  List<Object> get props => [id, image, titre, description, date, time, location, color];

}