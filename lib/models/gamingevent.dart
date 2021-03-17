import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class GamingEvent extends ParentEvent {
  
  String gameCategory;

  GamingEvent(String gameCategory, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum, bool joined, 
  String adminId) :
    this.gameCategory = gameCategory,
    super(gameCategory, eventId, eventName, time, eventDescription, registered, maximum, joined, adminId);
}