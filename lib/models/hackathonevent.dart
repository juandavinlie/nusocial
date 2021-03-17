import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class HackathonEvent extends ParentEvent {
  
  String hackathonCategory;
  
  HackathonEvent(String hackathonCategory, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum, bool joined, 
  String adminId) :
    this.hackathonCategory = hackathonCategory,
    super(hackathonCategory, eventId, eventName, time, eventDescription, registered, maximum, joined, adminId);
}