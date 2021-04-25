import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constraints.dart';

class Tasks extends StatefulWidget {
  final List<String> tasks;

  Tasks(this.tasks);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void _deleteTask(int index) {
    setState(() {
      widget.tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                // padding for alligning "Today's Tasks" with list
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Today's Tasks",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              (widget.tasks.isEmpty)
                  ? Column(
                      // "No Tasks" text and illustration
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              kBackgroundColor,
                              BlendMode.multiply,
                            ),
                            child: Image.asset(
                              "assets/images/empty-tasks.PNG",
                              height: 210.h,
                            ),
                          ),
                        ),
                        Text(
                          "No tasks!",
                          style: TextStyle(
                              color: softTextColor,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : Expanded(
                      // task list
                      child: ListView.builder(
                        itemCount: widget.tasks.length,
                        itemBuilder: (ctx, index) {
                          return _buildTaskContainer(
                            ctx,
                            widget.tasks[index],
                            index,
                          );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  LayoutBuilder _buildTaskContainer(
    BuildContext context,
    String task,
    int index,
  ) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [kBoxShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // defines width that text can extend
                width: constraints.maxWidth * 0.7,
                child: Text(
                  task,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GestureDetector(
                // trash icon
                onTap: () => _deleteTask(index),
                child: Icon(
                  Icons.delete,
                  color: textColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
