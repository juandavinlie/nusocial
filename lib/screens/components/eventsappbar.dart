import 'package:flutter/material.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/otherevent.dart';
import 'package:nusocial/screens/home.dart';
import 'package:nusocial/services/database.dart';
import 'package:provider/provider.dart';

import '../eventlist.dart';

class EventsAppBar extends StatefulWidget {

  String of;
  EventsAppBar({ this.of });

  @override
  _EventsAppBarState createState() => _EventsAppBarState();
}

class _EventsAppBarState extends State<EventsAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: StreamProvider<List<AcademicEvent>>.value(
      initialData: [],
      value: DatabaseService().academicEvents,
      child: StreamProvider<List<ActivityEvent>>.value(
        initialData: [],
        value: DatabaseService().activityEvents,
          child: StreamProvider<List<GamingEvent>>.value(
            initialData: [],
            value: DatabaseService().gamingEvents,
            child: StreamProvider<List<HackathonEvent>>.value(
              initialData: [],
              value: DatabaseService().hackathonEvents,
              child: StreamProvider<List<OtherEvent>>.value(
                initialData: [],
                value: DatabaseService().otherEvents,
                child: EventList(of: widget.of)
              )
            )
          )
        )
      )
    );
  }
}