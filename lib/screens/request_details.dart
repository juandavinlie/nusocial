import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/screens/components/appbar_without_search.dart';
import 'package:nusocial/screens/components/body.dart';
import 'package:nusocial/screens/components/custom_drawer.dart';

class RequestDetails extends StatefulWidget {
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWithoutSearch(
          autoImplyLeading: true,
          text1: 'NUS',
          text2: 'ocial',
        ),
      ),
      body: Padding(
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
              Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: kDefaultPadding,
                    child: ElevatedButton(
                      child: Text('Join'),
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Subtitle(
                        text: 'Participants',
                      ),
                      Participant(
                        fullName: 'Louis Davin Lie',
                      ),
                      Participant(fullName: 'Juan Davin Lie'),
                      Participant(
                        fullName: 'Elon Musk',
                      ),
                      Participant(
                        fullName: 'Tahir',
                      ),
                      Participant(
                        fullName: 'Bob',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildActivityDetails() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Activity Name goes here',
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
              'Activity Description goes here',
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
                          'Date: 15 - 01 - 2021',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          'Time: 10:30',
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
                      child: Text('5 / 5'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }

  Container buildProfileSection() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: kDefaultPadding),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/anon.jpg'),
                  radius: 50,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Louis Davin Lie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Year 1, Computer Science',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: kDefaultPadding,
            top: 70,
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.person),
                  ),
                  Container(
                    child: Text('0 / 5'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Participant extends StatelessWidget {
  const Participant({
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
