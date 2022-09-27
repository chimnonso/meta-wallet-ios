import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'models.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy Bread'),
    Task(name: 'Last task'),
    Task(name: 'Buy Tea'),
  ];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get getCount {
    return tasks.length;
  }

  void addTask(String newTaskText) {
    _tasks.add(Task(name: newTaskText));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleStatus();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
