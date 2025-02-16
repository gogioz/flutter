class Task {
  int id;
  String text;
  Status status = Status.Not;
  static int count = 0;

  Task({required this.text}) : id = ++count;
}

enum Status { Done, Not }
