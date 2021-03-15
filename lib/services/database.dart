import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/otherevent.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

  CollectionReference academicevents = Firestore.instance.collection('categories').document("Academics").collection("academicevents");
  CollectionReference activityevents = Firestore.instance.collection('categories').document("Activities").collection("activityevents");
  CollectionReference hackathonevents = Firestore.instance.collection('categories').document("Hackathon").collection("hackathonevents");
  CollectionReference gamingevents = Firestore.instance.collection('categories').document("Gaming").collection("gamingevents");
  CollectionReference otherevents = Firestore.instance.collection('categories').document("Others").collection("otherevents");

  List<AcademicEvent> _academicEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return AcademicEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          doc['time'],
          doc['eventDescription'],
          doc['registered'],
          doc['maximum']
        );
      }
    ).toList();
  }

  List<ActivityEvent> _activityEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return ActivityEvent(
          doc['category'],
          doc.documentID,
          doc['eventName'],
          doc['time'],
          doc['eventDescription'],
          doc['registered'],
          doc['maximum']
        );
      }
    ).toList();
  }

  List<GamingEvent> _gamingEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return GamingEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          doc['time'],
          doc['eventDescription'],
          doc['registered'],
          doc['maximum']
        );
      }
    ).toList();
  }

  List<HackathonEvent> _hackathonEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return HackathonEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          doc['time'],
          doc['eventDescription'],
          doc['registered'],
          doc['maximum']
        );
      }
    ).toList();
  }

  List<OtherEvent> _otherEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return OtherEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          doc['time'],
          doc['eventDescription'],
          doc['registered'],
          doc['maximum']
        );
      }
    ).toList();
  }

  Stream<List<AcademicEvent>> get academicEvents {
    return academicevents.snapshots().map(_academicEventListFromQuerySnapshot);
  }

  Stream<List<ActivityEvent>> get activityEvents {
    return activityevents.snapshots().map(_activityEventListFromQuerySnapshot);
  }

  Stream<List<GamingEvent>> get gamingEvents {
    return gamingevents.snapshots().map(_gamingEventListFromQuerySnapshot);
  }

  Stream<List<HackathonEvent>> get hackathonEvents {
    return hackathonevents.snapshots().map(_hackathonEventListFromQuerySnapshot);
  }

  Stream<List<OtherEvent>> get otherEvents {
    return otherevents.snapshots().map(_otherEventListFromQuerySnapshot);
  }
}