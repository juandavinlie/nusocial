import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/screens/components/eventsappbar.dart';
import 'package:nusocial/services/auth.dart';

import '../eventlist.dart';

class Body extends StatelessWidget {
  void navigateTo(String category, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventList(of: category)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Subtitle(text: 'Categories')),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsAppBar(of: "Academics")));
              },
              child:
                  SingleCategory(text: 'Academics', icon: Icons.book_outlined)),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsAppBar(of: "Activities")));
              },
              child: SingleCategory(
                  text: 'Activities', icon: Icons.sports_baseball_outlined)),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsAppBar(of: "Gaming")));
              },
              child: SingleCategory(
                  text: 'Gaming', icon: Icons.sports_esports_outlined)),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsAppBar(of: "Hackathons")));
              },
              child: SingleCategory(
                  text: 'Hackathons', icon: Icons.computer_outlined)),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsAppBar(of: "Other")));
              },
              child: SingleCategory(
                  text: 'Others', icon: Icons.add_circle_outline)),
        ],
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              offset: Offset(2, 2),
              blurRadius: 2,
              color: Colors.blue.withOpacity(0.13),
            )
          ],
        ),
        margin: EdgeInsets.only(bottom: kDefaultPadding - 5),
        height: 80,
        child: Center(
            child: Row(
          children: [
            Container(
                child: Icon(
                  icon,
                  size: 40,
                ),
                margin: EdgeInsets.only(right: 20)),
            Container(
                child: Text(
              text,
              style: TextStyle(fontSize: 20),
            )),
          ],
        )),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: kDefaultPadding - 5, top: kDefaultPadding - 5),
        height: 24,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding / 4,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(right: kDefaultPadding / 4),
                  height: 7,
                  color: Colors.blue.withOpacity(0.2),
                ))
          ],
        ));
  }
}
