import 'package:flutter/material.dart';
import 'package:todo_list_purple/models/tasktype.dart';

import 'mission.dart';

class Missions with ChangeNotifier {
  List<Mission> missions = [
    Mission(
        title: 'Study lesson',
        taskType: TaskType.category,
        explanation: '',
        isDone: false),
    Mission(
        title: 'Run 5k',
        taskType: TaskType.contest,
        explanation: '4:00 p.m',
        isDone: false),
    Mission(
        title: 'Go to party',
        taskType: TaskType.calendar,
        explanation: '10.00 p.m',
        isDone: false),
  ];
}
