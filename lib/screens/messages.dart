import 'package:flutter/material.dart';
import 'package:nusocial/screens/components/appbar_without_search.dart';
import 'package:nusocial/screens/components/custom_drawer.dart';

import '../constants.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWithoutSearch(
          autoImplyLeading: false,
          text1: 'NUS',
          text2: 'ocial',
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      endDrawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/anon.jpg'),
                        radius: 30,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Louis Davin Lie',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/anon.jpg'),
                        radius: 30,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Juan Davin Lie',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
