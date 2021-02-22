import 'package:flutter/material.dart';

import '../contraints.dart';

class Buttons extends StatelessWidget {
  final Function toggleTimer;
  final Function togglePause;
  final bool isTimerPaused;
  final bool isTimerRunning;

  Buttons(
    this.toggleTimer,
    this.isTimerRunning,
    this.togglePause,
    this.isTimerPaused,
  );

  InkWell _buildButton({String text, Color color, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: 160,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kBoxShadow],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (isTimerRunning)
            ? (isTimerPaused)
                ? _buildButton(
                    text: "Resume Timer",
                    color: kDarkGreenColor,
                    ontap: () => togglePause(),
                  )
                : _buildButton(
                    text: "Pause Timer",
                    color: kDarkGreenColor,
                    ontap: () => togglePause(),
                  )
            : _buildButton(
                text: "New Task",
                color: kDarkGreenColor,
                ontap: () {},
              ),
        _buildButton(
          text: (isTimerRunning) ? "Stop Timer" : "Start Timer",
          color: kPurpleColor,
          ontap: () => toggleTimer(),
        )
      ],
    );
  }
}
