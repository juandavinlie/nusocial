import 'package:flutter/material.dart';
import 'package:nusocial/models/parentevent.dart';
import 'package:nusocial/screens/event_details.dart';

import '../../constants.dart';

class EventCard extends StatefulWidget {
  ParentEvent event;
  String useruid;

  EventCard({this.event, this.useruid});
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {

    //final chosenEvent = Provider.of<AcademicEvent>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetails(event: widget.event, useruid: widget.useruid)));
      },
          child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          child: Container(
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    widget.event.eventName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[100],
                  thickness: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.book_outlined),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Container(
                              child: Text(
                                widget.event.category,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date:'),
                              Container(
                                child: Text(
                                  widget.event.time.toLocal().toString().substring(0, 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Time:'),
                              Container(
                                child: Text(
                                  widget.event.time.toLocal().toString().substring(11, 19),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
