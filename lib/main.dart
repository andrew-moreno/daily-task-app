import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constraints.dart';
import "./screens/homescreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.73, 759.27),
      builder: () => MaterialApp(
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
                  fontSize: 58.sp,
                ),
                headline3: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                headline5: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp),
                headline6: TextStyle(color: textColor),
              ),
        ),
        home: Homescreen(),
      ),
    );
  }
}
