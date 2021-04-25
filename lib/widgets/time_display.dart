import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constraints.dart';

class TimeDisplay extends StatelessWidget {
  final bool _isTimerRunning;
  final bool _isFocusTime;
  final int _minutes;

  TimeDisplay(this._isTimerRunning, this._isFocusTime, this._minutes);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 173.h,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kLightGreenColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [kBoxShadow],
      ),
      child: (_isTimerRunning)
          ? (_minutes == 0 && _isFocusTime)
              ? _buildDisplayText(
                  context: context,
                  text: "It's break time, bitch",
                )
              : (_minutes == 0 && !_isFocusTime)
                  ? _buildDisplayText(
                      context: context,
                      text: "It's focus time, bitch",
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          : _buildDisplayText(
              context: context,
              text: "Start that timer, bitch",
            ),
    );
  }
}

Padding _buildDisplayText({BuildContext context, String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Center(
      child: AutoSizeText(
        text,
        maxLines: 2,
        style: Theme.of(context).textTheme.headline2,
      ),
    ),
  );
}
