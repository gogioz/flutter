import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List tasks = [];
  @override
  void initState() {
    load();
  }

  load() async {
    Uri path = Uri.parse("https://api.mohamed-sadek.com/Task/Get");
    Map<String, String> header = {"Content-Type": "application/json"};
    var res = await http.get(path, headers: header);
    // print(res.body);
    Map<String, dynamic> decodedResponse = json.decode(res.body);

    List<dynamic> temp = decodedResponse["Data"] ?? [];
    List<Map<String, dynamic>> taskss = List<Map<String, dynamic>>.from(temp);
    // print(taskss);

    //map dymainc to Student
    setState(() {
      tasks = taskss;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
      ),
      body: ListView(
        children: tasks
            .map((task) => ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed("edit-task",
                      arguments: {"title": task["Title"], "ID": task["ID"]});
                },
                title: Text(task["Title"])))
            .toList(),
      ),
    );
  }
}
