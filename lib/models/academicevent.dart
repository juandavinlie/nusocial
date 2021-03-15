import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class AcademicEvent extends ParentEvent {

  String academicCategory;

  AcademicEvent(String academicCategory, String eventId, String eventName, Timestamp time, String eventDescription, int registered, int maximum) :
    this.academicCategory = academicCategory,
    super(eventId, eventName, time, eventDescription, registered, maximum);
}