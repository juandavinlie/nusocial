import 'package:flutter/material.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/otherevent.dart';
import 'package:nusocial/screens/loading.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/eventcard.dart';

class EventList extends StatefulWidget {

  String of;

  EventList({this.of});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  @override
  Widget build(BuildContext context) {

    final academicEvents = Provider.of<List<AcademicEvent>>(context);
    final activityEvents = Provider.of<List<ActivityEvent>>(context);
    final gamingEvents = Provider.of<List<GamingEvent>>(context);
    final hackathonEvents = Provider.of<List<HackathonEvent>>(context);
    final otherEvents = Provider.of<List<OtherEvent>>(context);

    switch (widget.of) {
      case "Academics":
        return academicEvents == null ? Loading() : ListView.builder(
          itemCount: academicEvents.length, 
          itemBuilder: (context, index) {
            return EventCard(event: academicEvents[index]);
          });
        break;
      case "Activities":
        return activityEvents == null ? Loading() : ListView.builder(
          itemCount: activityEvents.length, 
          itemBuilder: (context, index) {
            return EventCard(event: activityEvents[index]);
          });
        break;
      case "Gaming":
        return gamingEvents == null ? Loading() : ListView.builder(
          itemCount: gamingEvents.length, 
          itemBuilder: (context, index) {
            return EventCard(event: gamingEvents[index]);
          });
        break;
      case "Hackathons":
        return hackathonEvents == null ? Loading() : ListView.builder(
          itemCount: hackathonEvents.length, 
          itemBuilder: (context, index) {
            return EventCard(event: hackathonEvents[index]);
          });
        break;
      case "Other":
        return otherEvents == null ? Loading() : ListView.builder(
          itemCount: otherEvents.length, 
          itemBuilder: (context, index) {
            return EventCard(event: otherEvents[index]);
          });
        break;
      default:
        break;
    }
  }
}