import 'package:flutter/material.dart';

class User {
  String uid;
  String name;
  int year;
  String major;

  User(String uid, String name, int year, String major) {
    this.uid = uid;
    this.name = name;
    this.year = year;
    this.major = major;
  }
} 