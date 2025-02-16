class Task {
  String title;
  String descrition;
  Kind kind;

  Task({
    required this.title,
    required this.descrition,
    required this.kind,
  });
}

enum Kind { family, hobby, sport, other, study, travel, shopping }
