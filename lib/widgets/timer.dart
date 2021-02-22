import 'dart:async';
import 'package:flutter/material.dart';

import '../contraints.dart';

class TimeDisplay extends StatefulWidget {
  final bool _isTimerRunning;
  final int _minutes;
  TimeDisplay(this._isTimerRunning, this._minutes);

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  @override
  Widget build(BuildContext context) {
    print(widget._minutes);
    int _minutes = widget._minutes;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kLightGreenColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [kBoxShadow],
      ),
      child: (widget._isTimerRunning)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$_minutes",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "minutes\nleft",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            )
          : Text(
              "Start that timer, bitch",
              style: Theme.of(context).textTheme.headline2,
            ),
    );
  }
}
