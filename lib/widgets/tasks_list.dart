import 'package:flutter/material.dart';
import 'package:todo_ap/widgets/task_tile.dart';
import 'package:todo_ap/tasks_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              updateStatus: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              deleteTask: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.getCount,
        );
      },
    );
  }
}
