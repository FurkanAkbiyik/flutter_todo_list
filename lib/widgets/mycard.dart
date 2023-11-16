import 'package:flutter/material.dart';
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  isChecked = value!;
                });
              })
        ],
      ),
    );
  }
}
