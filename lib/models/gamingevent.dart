import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class GamingEvent extends ParentEvent {
  
  String gameCategory;

  GamingEvent(String gameCategory, String eventId, String eventName, Timestamp time, String eventDescription, int registered, int maximum) :
    this.gameCategory = gameCategory,
    super(eventId, eventName, time, eventDescription, registered, maximum);
}