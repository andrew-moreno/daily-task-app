import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/heading.dart';
import '../widgets/time_display.dart';
import '../widgets/tasks.dart';
import '../widgets/buttons.dart';
import '../contraints.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> tasks = [];

  bool isTimerRunning = false;
  bool isTimerPaused = false;
  int minutes;
  Timer _timer;
  int defaultTime = 10;
  int secondsInterval = 1;

  void _startTimer() {
    if (_timer != null) {
      _stopTimer();
    }
    minutes = defaultTime;

    _timer = Timer.periodic(Duration(seconds: secondsInterval), (_timer) {
      if (minutes > 0) {
        setState(() {
          minutes--;
        });
        print("1 minute passed, Time is: $minutes");
      } else {
        setState(() {
          minutes = defaultTime;
        });

        _timer.cancel();
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      minutes = defaultTime;
      print("timer cleared");
    }
  }

  void pauseTimer() {
    _timer.cancel();
  }

  void resumeTimer() {
    _timer = Timer.periodic(Duration(seconds: secondsInterval), (_timer) {
      if (minutes > 0) {
        setState(() {
          minutes--;
        });
        print("1 minute passed");
      } else {
        minutes = defaultTime;
        _timer.cancel();
      }
    });
  }

  void toggleTimer() {
    if (isTimerRunning) {
      setState(() {
        isTimerRunning = false;
      });
      isTimerPaused = false;
      _stopTimer();
    } else {
      setState(() {
        isTimerRunning = true;
      });
      _startTimer();
    }
  }

  void togglePause() {
    if (isTimerPaused) {
      setState(() {
        isTimerPaused = false;
      });
      resumeTimer();
    } else {
      setState(() {
        isTimerPaused = true;
      });
      pauseTimer();
    }
  }

  void addTask(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 30,
            right: 30,
            bottom: 15,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Task",
              labelStyle: Theme.of(context).textTheme.headline6,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: textColor,
                ),
              ),
            ),
            cursorColor: textColor,
            autofocus: true,
            onSubmitted: (taskName) {
              setState(() {
                tasks.add(taskName);
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.0, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Heading(),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
                child: TimeDisplay(
                  isTimerRunning,
                  minutes,
                ),
              ),
              Expanded(
                child: Tasks(
                  tasks,
                ),
              ),
              Buttons(
                toggleTimer,
                isTimerRunning,
                togglePause,
                isTimerPaused,
                addTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
