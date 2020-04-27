import 'package:flutter/material.dart';

dynamic getTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xffE32F22),
    accentColor:  Color(0xffD50F02),

    fontFamily: 'Quicksand',

    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}