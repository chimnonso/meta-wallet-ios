import 'package:flutter/material.dart';
import 'package:todo_ap/utils/constants.dart';
import 'package:todo_ap/widgets/tasks_list.dart';
import 'package:todo_ap/screens/add_task_screen.dart';
import 'package:todo_ap/tasks_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddTaskScreen(),
            isScrollControlled: true,
          );
        },
        backgroundColor: blueColor,
        child: const Icon(Icons.add),
      ),
      backgroundColor: blueColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 100.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: blueColor,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).getCount} Tasks',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
