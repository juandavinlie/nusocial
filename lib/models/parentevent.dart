import 'package:cloud_firestore/cloud_firestore.dart';

class ParentEvent {
  String eventId;
  String eventName;
  Timestamp time;
  String eventDescription;
  int registered;
  int maximum;

  ParentEvent(String eventId, String eventName, Timestamp time, String eventDescription, int registered, int maximum) {
    this.eventId = eventId;
    this.eventName = eventName;
    this.time = time;
    this.eventDescription = eventDescription;
    this.registered = registered;
    this.maximum = maximum;
  }
}