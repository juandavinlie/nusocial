import 'package:flutter/material.dart';

import '../constants.dart';
import 'components/appbar_without_search.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWithoutSearch(
          autoImplyLeading: true,
          text1: 'NUS',
          text2: 'ocial',
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(Icons.person),
                title: Text('Account'),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(Icons.settings_display),
                title: Text('Display'),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {},
              ),
            )
          ],
        )
      ),
    );
  }
}
