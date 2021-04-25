import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/heading.dart';
import '../widgets/time_display.dart';
import '../widgets/tasks.dart';
import '../widgets/buttons.dart';
import '../constraints.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> tasks = [];

  bool isTimerRunning = false;
  bool isTimerPaused = false;
  bool isFocusTime = true;
  bool isTimerChanging = false;
  int minutes;
  Timer _timer;
  int _focusTime = 5;
  int _breakTime = 2;
  int _secondsInterval = 1; // set to 2 for testing

  void _setTimer() {
    _timer = Timer.periodic(Duration(seconds: _secondsInterval), (_timer) {
      if (minutes > 1) {
        // set to one so that pause executes on 0 count
        setState(() {
          minutes--;
        });
        print("1 minute passed, Time is: $minutes");
      } else {
        setState(() {
          minutes--;
        });
        togglePause();
        _timer.cancel();
        setState(() {
          isTimerChanging = true;
        });
      }
    });
  }

  void _startTimer() {
    print("Starting timer");
    if (_timer != null) {
      _stopTimer();
    }
    minutes = _focusTime;
    _setTimer();
  }

  void _stopTimer() {
    print("Stopping timer");
    if (_timer != null) {
      _timer.cancel();
      print("timer cleared");
    }
  }

  void _pauseTimer() {
    print("Pausing timer");
    _timer.cancel();
    setState(() {
      isTimerPaused = true;
    });
  }

  void _resumeTimer() {
    print("Resuming timer");
    _setTimer();
    setState(() {
      isTimerPaused = false;
    });
  }

  void toggleTimer() {
    if (isTimerRunning) {
      setState(() {
        isTimerRunning = false;
      });
      _stopTimer();
    } else {
      setState(() {
        isTimerRunning = true;
      });
      _startTimer();
    }
  }

  void togglePause() {
    if (isTimerPaused)
      _resumeTimer();
    else
      _pauseTimer();
  }

  void toggleTimerMode() {
    if (isFocusTime) {
      setState(() {
        minutes = _breakTime;
      });
      isFocusTime = false;
      _setTimer();
      isTimerPaused = false;
      isTimerChanging = false;
      print("Entered break time");
    } else {
      setState(() {
        minutes = _focusTime;
      });
      isFocusTime = true;
      _setTimer();
      isTimerPaused = false;
      isTimerChanging = false;
      print("Entered focus time");
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
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            // fixes overflow error when typing
            child: Container(
              // screen height - notification bar - padding
              height: 1.sh - MediaQuery.of(context).padding.top - 20.h - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Heading(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
                    child: TimeDisplay(
                      isTimerRunning,
                      isFocusTime,
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
                    toggleTimerMode,
                    isTimerChanging,
                    isFocusTime,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
