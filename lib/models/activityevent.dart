import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class ActivityEvent extends ParentEvent {
  String activityCategory;

  ActivityEvent(String activityCategory, String eventId, String eventName, Timestamp time, String eventDescription, int registered, int maximum) :
    this.activityCategory = activityCategory,
    super(eventId, eventName, time, eventDescription, registered, maximum);
}