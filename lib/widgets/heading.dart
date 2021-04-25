import 'package:flutter/material.dart';

import '../constraints.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Productivity Bitch",
          style: Theme.of(context).textTheme.headline5,
        ),
        InkWell(
          // settings button
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [kBoxShadow],
            ),
            child: Icon(
              Icons.settings,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
