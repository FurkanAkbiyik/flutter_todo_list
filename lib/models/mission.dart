import 'tasktype.dart';

class Mission {
  final String title;
  final TaskType taskType;
  final String explanation;
  final bool isDone;

  Mission(
      {required this.title,
      required this.taskType,
      required this.explanation,
      required this.isDone});
}
