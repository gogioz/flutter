import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/Models/student.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isloading = false;
  var formkey = GlobalKey<FormState>();
  Task task = Task(
    title: "",
    descrition: "",
    kind: Kind.other,
  );

  save() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      setState(() {
        isloading = true;
      });

      Uri path = Uri.parse("https://api.mohamed-sadek.com/Task/POST");
      Map<String, String> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "title": task.title,
        "description": task.descrition,
        "kind": task.kind.toString().split('.').last,
      };
      print(body);
      var res = await http.post(path, headers: header, body: json.encode(body));
      // print(res.statusCode);
      // print(res.body);

      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        actions: [
          IconButton(
            onPressed: () {
              formkey.currentState!.reset();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: isloading
          ? Center(
              child: SpinKitDoubleBounce(
                color: Colors.deepPurple,
              ),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    TextFormField(
                      onSaved: (value) => setState(() {
                        task.title = value!;
                      }),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text("Title"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (value) => setState(() {
                        task.descrition = value!;
                      }),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<Kind>(
                      value: task.kind,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      items: Kind.values.map((Kind kind) {
                        return DropdownMenuItem<Kind>(
                          value: kind,
                          child: Text(kind.toString().split('.').last),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          task.kind = newValue!;
                        });
                      },
                      onSaved: (newValue) {
                        task.kind = newValue!;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        save();
                        Navigator.of(context).pushNamed(
                          "tasks-list",
                        );
                      },
                      child: Text("Add Task"),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
