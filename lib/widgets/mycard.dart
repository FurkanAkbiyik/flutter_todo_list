import 'package:flutter/material.dart';
import 'package:todo_list_purple/constants/colors.dart';
import 'package:todo_list_purple/models/todo.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.mission});
  final Todo mission;
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.mission.completed == true ? cardIsDoneColor : Colors.white,
      child: Row(
        children: [
          // GestureDetector(
          //     child: widget.mission.taskType == TaskType.category
          //         ? Image.asset('assets/Category.png')
          //         : widget.mission.taskType == TaskType.contest
          //             ? Image.asset('assets/contest.png')
          //             : Image.asset('assets/calendar.png')),
          Image.asset('assets/Category.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.mission.todo!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: widget.mission.completed == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                Text('User : ${widget.mission.userId}'),
              ],
            ),
          ),
          const Spacer(),
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.mission.completed == true
                      ? isChecked = true
                      : isChecked = value!;
                });
              })
        ],
      ),
    );
  }
}
