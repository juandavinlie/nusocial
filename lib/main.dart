import 'package:flutter/material.dart';
import 'package:nusocial/screens/authenticate/register.dart';
import 'package:nusocial/screens/home.dart';
import 'package:nusocial/screens/messages.dart';
import 'package:nusocial/screens/request_details.dart';
import 'package:nusocial/screens/wrapper.dart';
import 'package:nusocial/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/messages': (context) => MessagesScreen(),
        },
      ),
    );
  }
}
