import 'dart:convert';

import 'package:todo_list_purple/models/todo.dart';
import 'package:http/http.dart ' as http;

class TodoService {
  final String url = 'https://dummyjson.com/todos';
  Future<List<Todo>> getUncompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)['todos'];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo mission = Todo.fromJson(element);
      if (mission.completed! == false) {
        todos.add((mission));
      }
    }

    return todos;
  }

  Future<List<Todo>> getCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)['todos'];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo mission = Todo.fromJson(element);
      if (mission.completed! == true) {
        todos.add(mission);
      }
    }
    return todos;
  }
}
