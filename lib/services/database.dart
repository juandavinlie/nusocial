import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/localuser.dart';
import 'package:nusocial/models/otherevent.dart';
import 'package:nusocial/models/participant.dart';
import 'package:nusocial/models/user.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

  CollectionReference academicevents = Firestore.instance
      .collection('categories')
      .document("Academics")
      .collection("events");
  CollectionReference activityevents = Firestore.instance
      .collection('categories')
      .document("Activities")
      .collection("events");
  CollectionReference hackathonevents = Firestore.instance
      .collection('categories')
      .document("Hackathons")
      .collection("events");
  CollectionReference gamingevents = Firestore.instance
      .collection('categories')
      .document("Gaming")
      .collection("events");
  CollectionReference otherevents = Firestore.instance
      .collection('categories')
      .document("Others")
      .collection("events");
  CollectionReference userCollection = Firestore.instance.collection('users');
  Query eventCollection = Firestore.instance.collectionGroup('events');

  LocalUser _localUserFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return LocalUser(uid, snapshot.data['name'], snapshot.data['year'], snapshot.data['major'], snapshot.data['telegramHandle']);
  }

  List<Participant> _participantListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Participant(name: doc['name'], telegram: doc['telegramHandle']);
    }).toList();
  }

  /*AcademicEvent _academicEventFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return AcademicEvent(snapshot.data['category'], snapshot.data['eventId'], snapshot.data['eventName'], snapshot.data['time'], snapshot.data['eventDescription'], snapshot.data['registered'], snapshot.data['maximum']);
  }

  ActivityEvent _activityEventFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return ActivityEvent(snapshot.data['category'], snapshot.data['eventId'], snapshot.data['eventName'], snapshot.data['time'], snapshot.data['eventDescription'], snapshot.data['registered'], snapshot.data['maximum']);
  }

  GamingEvent _gamingEventFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return GamingEvent(snapshot.data['category'], snapshot.data['eventId'], snapshot.data['eventName'], snapshot.data['time'], snapshot.data['eventDescription'], snapshot.data['registered'], snapshot.data['maximum']);
  }

  HackathonEvent _hackathonEventFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return HackathonEvent(snapshot.data['category'], snapshot.data['eventId'], snapshot.data['eventName'], snapshot.data['time'], snapshot.data['eventDescription'], snapshot.data['registered'], snapshot.data['maximum']);
  }

  OtherEvent _otherEventFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return OtherEvent(snapshot.data['category'], snapshot.data['eventId'], snapshot.data['eventName'], snapshot.data['time'], snapshot.data['eventDescription'], snapshot.data['registered'], snapshot.data['maximum']);
  }*/

  List<AcademicEvent> _academicEventListFromQuerySnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return AcademicEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          DateTime.fromMillisecondsSinceEpoch(doc['time']).toLocal(),
          doc['eventDescription'],
          doc['registered'],
          doc['maximum'],
          doc['registered'] == doc['maximum'],
          doc['adminId']);
    }).toList();
  }

  List<ActivityEvent> _activityEventListFromQuerySnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ActivityEvent(
          doc['category'],
          doc.documentID,
          doc['eventName'],
          DateTime.fromMillisecondsSinceEpoch(doc['time']).toLocal(),
          doc['eventDescription'],
          doc['registered'],
          doc['maximum'],
          doc['registered'] == doc['maximum'],
          doc['adminId']);
    }).toList();
  }

  List<GamingEvent> _gamingEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return GamingEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          DateTime.fromMillisecondsSinceEpoch(doc['time']).toLocal(),
          doc['eventDescription'],
          doc['registered'],
          doc['maximum'],
          doc['registered'] == doc['maximum'],
          doc['adminId']);
    }).toList();
  }

  List<HackathonEvent> _hackathonEventListFromQuerySnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return HackathonEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          DateTime.fromMillisecondsSinceEpoch(doc['time']).toLocal(),
          doc['eventDescription'],
          doc['registered'],
          doc['maximum'],
          doc['registered'] == doc['maximum'],
          doc['adminId']);
    }).toList();
  }

  List<OtherEvent> _otherEventListFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return OtherEvent(
          doc['category'],
          doc['eventId'],
          doc['eventName'],
          DateTime.fromMillisecondsSinceEpoch(doc['time']).toLocal(),
          doc['eventDescription'],
          doc['registered'],
          doc['maximum'],
          doc['registered'] == doc['maximum'],
          doc['adminId']);
    }).toList();
  }

  Stream<LocalUser> get localUser {
    return userCollection.document(uid).snapshots().map(_localUserFromDocumentSnapshot);
  }

  Stream<List<Participant>> get participants {
    return userCollection.where('events', arrayContains: uid).snapshots().map(_participantListFromQuerySnapshot);
  }

  // get events of a user
  Future getEvents() {
    return userCollection.document(uid).get().then((value) {
      return value.data['events'];
    });
  }

  /*Stream<AcademicEvent> getChosenAcademicEvent(String eventId) {
    print(eventId);
    return academicevents.document(eventId).snapshots().map(_academicEventFromDocumentSnapshot);
  }
  Stream<ActivityEvent> getChosenActivityEvent(String eventId) {
    return activityevents.document(eventId).snapshots().map(_activityEventFromDocumentSnapshot);
  }
  Stream<GamingEvent> getChosenGamingEvent(String eventId) {
    return gamingevents.document(eventId).snapshots().map(_gamingEventFromDocumentSnapshot);
  }
  Stream<HackathonEvent> getChosenHackathonEvent(String eventId) {
    return hackathonevents.document(eventId).snapshots().map(_hackathonEventFromDocumentSnapshot);
  }
  Stream<OtherEvent> getChosenOtherEvent(String eventId) {
    return otherevents.document(eventId).snapshots().map(_otherEventFromDocumentSnapshot);
  }*/

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
    return hackathonevents
        .snapshots()
        .map(_hackathonEventListFromQuerySnapshot);
  }

  Stream<List<OtherEvent>> get otherEvents {
    return otherevents.snapshots().map(_otherEventListFromQuerySnapshot);
  }

  Future updateEvent(String eventId, String category, String eventName, int time,
      String eventDescription, int maximum, String adminId) async {
    return await Firestore.instance.collection('categories')
        .document(category)
        .collection('events')
        .document(eventId)
        .setData({
      'category': category,
      'eventId': eventId,
      'eventName': eventName,
      'time': time,
      'eventDescription': eventDescription,
      'registered': 0,
      'maximum': maximum,
      'joined' : false,
      'adminId' : adminId
    });
  }

  Future updateUser(User newUser) async {
    print("got here");
    return await Firestore.instance.collection('users')
        .document(newUser.uid)
        .setData({
      'name' : newUser.name,
      'year' : newUser.year,
      'major' : newUser.major,
      'telegramHandle' : newUser.telegram,
      'events' : []
    });
  }

  Future joinEvent(String eventId) async {
    return await userCollection.document(uid).updateData({
      'events': FieldValue.arrayUnion([eventId])
    });
  }

  Future addOneToRegister(String category, String eventId) async {
    return await Firestore.instance
      .collection('categories')
      .document(category)
      .collection("events").document(eventId).updateData({
        'registered' : FieldValue.increment(1)
      });
  }
}
