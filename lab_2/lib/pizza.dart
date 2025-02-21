import 'package:flutter/material.dart';

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String url = args['url']; // Extracting "url"
    String name = args['name']; // Extracting "name"

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Colors.orange[100],
      ),
      backgroundColor: Colors.orange[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: 350,
              height: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enjoy your $name !",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
