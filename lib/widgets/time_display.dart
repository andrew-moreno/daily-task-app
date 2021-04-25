import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../contraints.dart';

class TimeDisplay extends StatelessWidget {
  final bool _isTimerRunning;
  final int _minutes;
  final bool _isWorkTime;
  TimeDisplay(this._isTimerRunning, this._minutes, this._isWorkTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 173.h,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kLightGreenColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [kBoxShadow],
      ),
      child: (_isTimerRunning)
          ? (_minutes == 0 && _isWorkTime)
              ? _buildDisplayText("It's break time, bitch")
              : (_minutes == 0 && !_isWorkTime)
                  ? _buildDisplayText("It's focus time, bitch")
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            "$_minutes",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            "minutes\nleft",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    )
          : _buildDisplayText("Start that timer, bitch"),
    );
  }
}

Padding _buildDisplayText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Center(
      child: AutoSizeText(
        text,
        maxLines: 2,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 58.h,
        ),
      ),
    ),
  );
}
