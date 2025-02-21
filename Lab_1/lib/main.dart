import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    // routes: {},
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Lab 1 ",
            style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.teal[400]),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal[400],
          padding: EdgeInsets.all(15),
        ),
        child: const Text("Go to my profile",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "My Profile",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.teal[400]),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/imgs/avatar.jpg", // Replace with your image URL
              width: 200.0, // Set the width
              height: 200.0, // Set the height
              fit: BoxFit.cover, // Fit the image
            ),
          ),
          Column(
            children: [
              Text(
                "Hager Fathi",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "FRONT-END DEVELOPER",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Create great projects",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Text(
            "@ITI Aswan",
            style: TextStyle(color: Colors.teal[400], fontSize: 25),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.alternate_email,
                  color: Colors.grey,
                  size: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                  size: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.link_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.circle_notifications_outlined,
                      color: Colors.teal[400],
                      size: 60,
                    ),
                    Text("1.3k Followers",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.teal[400],
                      size: 60,
                    ),
                    Text("1.3k Followers",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
