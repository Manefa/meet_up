import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_up/features/event/entities/event_entity.dart';
import 'package:meet_up/features/event/models/event_model.dart';

class EventRepository {
  CollectionReference eventCollection = FirebaseFirestore.instance.collection('EVENTS');

  Future<void> addEvent(EventModel eventModel) {
    return eventCollection.add(eventModel.toEntity().toDocument());
  }

  Future<void> deleteEvent(EventModel eventModel) async {
    return eventCollection.doc(eventModel.id).delete();
  }

  Stream<List<EventModel>> getEvent1() {
    return eventCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => EventModel.fromEntity(EventEntity.fromSnapshot(doc))).toList(),
    );
  }

  Stream<List<EventModel>> getEvent4() {
    return eventCollection
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => EventModel.fromEntity(document.data()))
        .toList());
  }

  Future<void> updateEvent(EventModel eventModel) {
    return eventCollection
        .doc(eventModel.id)
        .set(eventModel.toEntity().toDocument());
  }

}