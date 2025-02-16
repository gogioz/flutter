import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("add-task");
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("Task Tracker"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Totla Tasks ",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              // Text("No Tasks added yet"),
            ]),
      ),
    );
  }
}
