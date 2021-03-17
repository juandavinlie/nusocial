import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/models/participant.dart';
import 'package:nusocial/screens/components/body.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          return ParticipantCard(participant: participants[index]);
        });
  }
}

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    Key key,
    this.participant,
  }) : super(key: key);

  final Participant participant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: kDefaultPadding),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/anon.jpg'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      participant.name,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      child: Text(
                        '@' + participant.telegram,
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                      onTap: () => launch('https://t.me/' + participant.telegram),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
