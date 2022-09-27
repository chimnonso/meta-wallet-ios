import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function(bool?)? updateStatus;
  final Function()? deleteTask;
  const TaskTile(
      {Key? key,
      required this.title,
      required this.isChecked,
      required this.updateStatus,
      required this.deleteTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: updateStatus,
      ),
      onLongPress: deleteTask,
    );
  }
}
