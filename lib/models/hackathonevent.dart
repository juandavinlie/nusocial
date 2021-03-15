import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class HackathonEvent extends ParentEvent {
  
  String hackathonCategory;
  
  HackathonEvent(String hackathonCategory, String eventId, String eventName, Timestamp time, String eventDescription, int registered, int maximum) :
    this.hackathonCategory = hackathonCategory,
    super(eventId, eventName, time, eventDescription, registered, maximum);
}