import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusocial/models/localuser.dart';
import 'package:nusocial/models/user.dart';
import 'package:nusocial/screens/home.dart';
import 'package:nusocial/screens/loading.dart';
import 'package:nusocial/screens/messages.dart';
import 'package:nusocial/screens/new_request.dart';
import 'package:nusocial/services/auth.dart';
import 'package:nusocial/services/database.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();
    return StreamProvider<LocalUser>.value(
      initialData: null,
      value: DatabaseService(uid: user.uid).localUser,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeaderCustom(),
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
                  Navigator.pushNamed(context, '/messages');
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
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                title: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Text(
                      'Create an Event',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewRequest(uid: user.uid)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerHeaderCustom extends StatefulWidget {
  @override
  _DrawerHeaderCustomState createState() => _DrawerHeaderCustomState();
}

class _DrawerHeaderCustomState extends State<DrawerHeaderCustom> {
  @override
  Widget build(BuildContext context) {
    final localUser = Provider.of<LocalUser>(context);

    return localUser == null
        ? Loading()
        : DrawerHeader(
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
                      color: Colors.grey,
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(localUser.name,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Year ' + localUser.year.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(localUser.major,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //   child: RichText(
                    //     text: TextSpan(
                    //         text: 'Edit Profile',
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           color: Colors.grey[600],
                    //         ),
                    //         recognizer: TapGestureRecognizer()..onTap = () {}),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          );
  }
}
