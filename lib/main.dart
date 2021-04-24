import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contraints.dart';
import "./screens/homescreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 759.2727272727273),
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
                bodyText2: TextStyle(
                  color: textColor,
                ),
                headline6: TextStyle(color: textColor),
              ),
        ),
        home: Homescreen(),
      ),
    );
  }
}
