import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/parentevent.dart';

class AcademicEvent extends ParentEvent {

  String academicCategory;

  AcademicEvent(String academicCategory, String eventId, String eventName, DateTime time, String eventDescription, int registered, int maximum, bool joined, 
  String adminId) :
    this.academicCategory = academicCategory,
    super(academicCategory, eventId, eventName, time, eventDescription, registered, maximum, joined, adminId);
}