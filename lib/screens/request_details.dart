import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/models/parentevent.dart';
import 'package:nusocial/models/participant.dart';
import 'package:nusocial/screens/components/appbar_without_search.dart';
import 'package:nusocial/screens/components/body.dart';
import 'package:nusocial/screens/components/custom_drawer.dart';
import 'package:nusocial/screens/components/participantlist.dart';
import 'package:nusocial/services/database.dart';
import 'package:provider/provider.dart';

class RequestDetails extends StatefulWidget {
  ParentEvent event;
  String useruid;

  RequestDetails({this.event, this.useruid});

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWithoutSearch(
            autoImplyLeading: true,
            text1: 'NUS',
            text2: 'ocial',
          ),
        ),
        body: StreamProvider<List<Participant>>.value(
          initialData: [],
          value: DatabaseService(uid: widget.event.eventId).participants,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // buildProfileSection(),
                  // Divider(
                  //   thickness: 1,
                  // ),
                  buildActivityDetails(),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: Text('Join'),
                          onPressed: () async {
                            await DatabaseService(uid: widget.useruid)
                                .joinEvent(widget.event.eventId);
                            await DatabaseService().addOneToRegister(widget.event.category, widget.event.eventId);
                            setState(() {
                              widget.event.incrementRegistered();
                            });
                          },
                        ),
                        SizedBox(
                          height: 200.0,
                          child: ParticipantList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Container buildActivityDetails() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              widget.event.eventName,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              widget.event.eventDescription,
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(
            thickness: 1,
          ),
          buildDetails()
        ],
      ),
    );
  }

  Stack buildDetails() {
    return Stack(
      children: [
        Container(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Date: ' +
                          widget.event.time
                              .toLocal()
                              .toString()
                              .substring(0, 10),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Time: ' +
                          widget.event.time
                              .toLocal()
                              .toString()
                              .substring(11, 19),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: kDefaultPadding,
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.person),
                ),
                Container(
                  child: Text(widget.event.registered.toString() +
                      ' / ' +
                      widget.event.maximum.toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  
  
}
