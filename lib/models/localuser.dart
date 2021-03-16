import 'package:flutter/material.dart';
import 'package:nusocial/models/user.dart';

class LocalUser extends User {
  LocalUser(String uid, String name, int year, String major)
      : super(uid, name, year, major);
}
