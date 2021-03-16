import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class OtherEvent extends ParentEvent {
  String otherCategory;

  OtherEvent(String otherCategory, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum) :
    this.otherCategory = otherCategory,
    super(otherCategory, eventId, eventName, time, eventDescription, registered, maximum);
}