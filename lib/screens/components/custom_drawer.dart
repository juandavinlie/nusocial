import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusocial/models/localuser.dart';
import 'package:nusocial/screens/home.dart';
import 'package:nusocial/screens/loading.dart';
import 'package:nusocial/screens/messages.dart';
import 'package:nusocial/screens/new_request.dart';
import 'package:nusocial/services/auth.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final localUser = Provider.of<LocalUser>(context);
    final AuthService _auth = AuthService();
    return localUser == null ? Loading() : Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/anon.jpg'),
                    radius: 50,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey[700],
                      width: 2,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(localUser.name),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Year ' + localUser.year.toString()),
                          Text(localUser.major),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: RichText(
                        text: TextSpan(
                            text: 'Edit Profile',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey[600],
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ),
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              if (ModalRoute.of(context).settings.name == '/') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () {
              if (ModalRoute.of(context).settings.name == '/messages') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(context, '/messages');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              _auth.signOut();
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            title: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text('Make a Request'),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRequest()),
              );
            },
          )
        ],
      ),
    );
  }
}
