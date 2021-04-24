import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../contraints.dart';

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
        IconButton(
          icon: Container(
            padding: EdgeInsets.only(
              top: 4,
              left: 4,
              right: 5,
              bottom: 5,
            ),
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
          onPressed: () {},
        ),
      ],
    );
  }
}
