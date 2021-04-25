import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constraints.dart';

class Buttons extends StatelessWidget {
  final Function toggleTimer;
  final Function togglePause;
  final Function addTask;
  final Function toggleTimerMode;
  final bool isTimerPaused;
  final bool isTimerRunning;
  final bool isTimerChanging;
  final bool isFocusTime;

  Buttons(
    this.toggleTimer,
    this.isTimerRunning,
    this.togglePause,
    this.isTimerPaused,
    this.addTask,
    this.toggleTimerMode,
    this.isTimerChanging,
    this.isFocusTime,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (isTimerChanging)
            ? _buildButton(
                // button for starting break/focus timer
                text: (isFocusTime) ? "Start your break" : "START GRINDING",
                color: kPurpleColor,
                ontap: () => toggleTimerMode(),
                width: 350.w,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (isTimerRunning)
                      ? _buildButton(
                          // button for pausing and resuming timer
                          text:
                              (isTimerPaused) ? "Resume Timer" : "Pause Timer",
                          color: kDarkGreenColor,
                          ontap: () => togglePause(),
                          width: 160.w,
                        )
                      : _buildButton(
                          // button for adding a new task
                          text: "New Task",
                          color: kDarkGreenColor,
                          ontap: () => addTask(context),
                          width: 160.w,
                        ),
                  _buildButton(
                    // button for starting and stopping timer
                    text: (isTimerRunning) ? "Stop Timer" : "Start Timer",
                    color: kPurpleColor,
                    ontap: () => toggleTimer(),
                    width: 160.w,
                  ),
                ],
              ),
      ],
    );
  }

  // button builder method
  InkWell _buildButton({
    String text,
    Color color,
    Function ontap,
    double width,
  }) {
    return InkWell(
      onTap: ontap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: width, // should be 160
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kBoxShadow],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: kBackgroundColor,
            fontSize: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
