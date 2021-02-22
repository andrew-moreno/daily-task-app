import 'package:flutter/material.dart';

import 'contraints.dart';
import "./screens/homescreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        canvasColor: kBackgroundColor,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              headline5:
                  TextStyle(color: textColor, fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                color: textColor,
              ),
            ),
      ),
      home: Homescreen(),
    );
  }
}
