import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List<String> tasks = [
    "Do school",
    "Boring stuff",
    "Coding this app!",
    "Voyage woohoo",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Tasks"),
    );
  }
}
