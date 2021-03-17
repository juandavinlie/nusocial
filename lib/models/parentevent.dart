import 'package:cloud_firestore/cloud_firestore.dart';

class ParentEvent {
  String category;
  String eventId;
  String eventName;
  DateTime time;
  String eventDescription;
  int registered;
  int maximum;
  bool joined;
  String adminId;

  ParentEvent(String category, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum, bool joined, 
  String adminId) {
    this.category = category;
    this.eventId = eventId;
    this.eventName = eventName;
    this.time = time;
    this.eventDescription = eventDescription;
    this.registered = registered;
    this.maximum = maximum;
    this.joined = joined;
    this.adminId = adminId;
  }

  void incrementRegistered() {
    registered++;
  }
}