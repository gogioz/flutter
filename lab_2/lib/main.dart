import 'package:flutter/material.dart';
import 'package:lab_2/pizza.dart';
import 'package:lab_2/pizzas.dart';
import 'package:lab_2/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      home: const MyHomePage(),
      routes: {
        "home": (context) => MyHomePage(),
        "questions": (context) => Questions(),
        "pizzas": (context) => Pizzas(),
        "pizza": (context) => Pizza(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Lab 2",
//           style: TextStyle(fontSize: 40),
//         ),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed("questions");
//               },
//               child: Text("Go to Questions"))),
//     );
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("../imgs/pizzas.jpeg"),
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to WOW Pizza!",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[600]),
                onPressed: () {
                  Navigator.of(context).pushNamed("pizzas");
                },
                child: Text(
                  "Start Ordering",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
