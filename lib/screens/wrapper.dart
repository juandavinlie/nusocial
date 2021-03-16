import 'package:flutter/material.dart';
import 'package:nusocial/models/user.dart';
import 'package:nusocial/screens/home.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    //returns Home or Authenticate widget depending on user authentication status
    return user != null ? HomeScreen() : Authenticate();
  }
}