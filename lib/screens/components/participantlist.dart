import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/models/participant.dart';
import 'package:nusocial/screens/components/body.dart';
import 'package:provider/provider.dart';

import '../request_details.dart';

class ParticipantList extends StatefulWidget {
  @override
  _ParticipantListState createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  @override
  Widget build(BuildContext context) {
    final participants = Provider.of<List<Participant>>(context);

    return ListView.builder(
        itemCount: participants.length,
        itemBuilder: (context, index) {
          return ParticipantCard(fullName: participants[index].name);
        });
  }
}

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    Key key,
    this.fullName,
  }) : super(key: key);

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/anon.jpg'),
            ),
          ),
          Container(
            child: Text(
              fullName,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
