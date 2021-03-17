import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class ActivityEvent extends ParentEvent {
  String activityCategory;

  ActivityEvent(String activityCategory, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum, bool joined, 
  String adminId) :
    this.activityCategory = activityCategory,
    super(activityCategory, eventId, eventName, time, eventDescription, registered, maximum, joined, adminId);
}