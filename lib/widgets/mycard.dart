import 'package:flutter/material.dart';
import 'package:todo_list_purple/constants/colors.dart';
import 'package:todo_list_purple/models/tasktype.dart';

import '../models/mission.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.mission});
  final Mission mission;
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.mission.isDone == true ? cardIsDoneColor : Colors.white,
      child: Row(
        children: [
          GestureDetector(
              child: widget.mission.taskType == TaskType.category
                  ? Image.asset('assets/Category.png')
                  : widget.mission.taskType == TaskType.contest
                      ? Image.asset('assets/contest.png')
                      : Image.asset('assets/calendar.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.mission.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: widget.mission.isDone == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                Text(widget.mission.explanation),
              ],
            ),
          ),
          const Spacer(),
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.mission.isDone == true
                      ? isChecked = true
                      : isChecked = value!;
                });
              })
        ],
      ),
    );
  }
}
