import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/Models/student.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
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

      Uri path = Uri.parse("https://api.mohamed-sadek.com/Task/");
      Map<String, String> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "title": "qqww",
      };
      print(body["title"]);
      var res = await http.put(path, headers: header, body: json.encode(body));
      // print(res.statusCode);
      print(res.body);

      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int id = args["ID"];
    String title = args["title"];
    print(id);
    print(title);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
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
                    ElevatedButton(
                      onPressed: () {
                        save();
                        Navigator.of(context).pushNamed(
                          "tasks-list",
                        );
                      },
                      child: Text("Save Task"),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
