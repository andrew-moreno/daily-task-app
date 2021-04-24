import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../contraints.dart';

class Buttons extends StatelessWidget {
  final Function toggleTimer;
  final Function togglePause;
  final Function addTask;
  final bool isTimerPaused;
  final bool isTimerRunning;

  Buttons(
    this.toggleTimer,
    this.isTimerRunning,
    this.togglePause,
    this.isTimerPaused,
    this.addTask,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (isTimerRunning)
            ? _buildButton(
                text: (isTimerPaused) ? "Resume Timer" : "Pause Timer",
                color: kDarkGreenColor,
                ontap: () => togglePause(),
              )
            : _buildButton(
                text: "New Task",
                color: kDarkGreenColor,
                ontap: () {
                  addTask(context);
                },
              ),
        _buildButton(
          text: (isTimerRunning) ? "Stop Timer" : "Start Timer",
          color: kPurpleColor,
          ontap: () => toggleTimer(),
        )
      ],
    );
  }

  InkWell _buildButton({String text, Color color, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: 160.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kBoxShadow],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
