import 'package:flutter/material.dart';
import 'package:lab_2/Models/question.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Map<int, Question> questions = {
    1: Question(
        text: "Lightning never strikes the same place twice.",
        correctAnswer: false),
    2: Question(
        text: "Bananas are berries, but strawberries are not.",
        correctAnswer: true),
    3: Question(
        text: "Goldfish have a three-second memory span.",
        correctAnswer: false),
    4: Question(
        text:
            "There are more stars in the universe than grains of sand on Earth.",
        correctAnswer: true),
    5: Question(
        text: "Water boils at 100°C at sea level.", correctAnswer: true),
    6: Question(
        text: "The Great Wall of China is visible from space.",
        correctAnswer: false),
    7: Question(text: "Is the Earth flat?", correctAnswer: false),
  };

  int currentIndex = 1;
  Map<int, bool> answers = {};
  bool quizCompleted = false;

  void answerQuestion(bool userAnswer) {
    setState(() {
      answers[currentIndex] =
          (userAnswer == questions[currentIndex]!.correctAnswer);

      if (currentIndex < questions.length) {
        currentIndex++;
      } else {
        quizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 174, 129, 169),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 40,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 174, 129, 169),
      body: Center(
        child: quizCompleted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quiz Completed!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your Score: ${answers.values.where((correct) => correct).length} / ${questions.length}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("home");
                    },
                    child: Text(
                      "Go to Home Page",
                      style:
                          TextStyle(color: Color.fromARGB(255, 174, 129, 169)),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // **Current Question Display**
                  Text(
                    "Question $currentIndex",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: answers.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          entry.value ? Icons.check_circle : Icons.cancel,
                          color: entry.value ? Colors.green : Colors.black,
                          size: 30,
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      questions[currentIndex]!.text,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // **Answer Buttons**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: answers.containsKey(currentIndex)
                            ? null
                            : () => answerQuestion(false),
                        child: Text(
                          'False',
                          style: TextStyle(
                              color: Color.fromARGB(255, 174, 129, 169),
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: answers.containsKey(currentIndex)
                            ? null
                            : () => answerQuestion(true),
                        child: Text(
                          'True',
                          style: TextStyle(
                              color: Color.fromARGB(255, 174, 129, 169),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // **Icons Tracker Row (Previous Answers)**
                ],
              ),
      ),
    );
  }
}
