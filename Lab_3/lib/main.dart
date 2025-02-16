import 'package:app/add_task.dart';
import 'package:app/edit_task.dart';
import 'package:app/tasks_list.dart';
import 'package:app/welcomescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        "welcome": (context) => WelcomeScreen(),
        "tasks-list": (context) => TasksList(),
        "add-task": (context) => AddTask(),
        "edit-task": (context) => EditTask(),
      },
    );
  }
}
