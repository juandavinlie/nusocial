import 'package:flutter/material.dart';

class User {
  String uid;
  String name;
  int year;
  String major;
  String telegram;

  User(String uid, String name, int year, String major, String telegram) {
    this.uid = uid;
    this.name = name;
    this.year = year;
    this.major = major;
    this.telegram = telegram;
  }
} 