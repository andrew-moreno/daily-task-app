import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/heading.dart';
import '../widgets/timer.dart';
import '../widgets/tasks.dart';
import '../widgets/buttons.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isTimerRunning = false;
  bool isTimerPaused = false;
  int minutes;
  Timer _timer;
  int defaultTime = 50;
  int secondsInterval = 1; // just for testing

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
        print("1 minute passed");
      } else {
        minutes = defaultTime;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Heading(),
              TimeDisplay(isTimerRunning, minutes),
              Tasks(),
              Buttons(
                toggleTimer,
                isTimerRunning,
                togglePause,
                isTimerPaused,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
