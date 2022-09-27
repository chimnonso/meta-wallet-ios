import 'package:flutter/material.dart';
import 'package:todo_ap/tasks_data.dart';
import 'package:todo_ap/utils/constants.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController addTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 40.0, right: 40.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add task',
                textAlign: TextAlign.center,
                style: TextStyle(color: blueColor, fontSize: 30.0),
              ),
              // Form(child: TextFormField()),
              TextField(
                controller: addTaskController,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(addTaskController.text);

                  addTaskController.clear();
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: blueColor,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
