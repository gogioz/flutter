void main() {
  Employee hager = Employee(id: 3, name: "Hager", salary: 1000);
  Manager negm = Manager(
    id: 8,
    name: "Negm",
    salary: 5000,
  );
  print(negm);
  Developer sarah =
      Developer(id: 1, name: "Sarah", salary: 3000, level: "Instractor");
  print(sarah);
  int result = hager.work(4, 5);
  int result2 = sarah.work(4, 5);

  print(result);
  print(result2);

  // print(object)
}

class Employee {
  int id;
  String name;
  double salary;
  int work(a, b) {
    return a + b;
  }

  Employee({
    required this.id,
    required this.name,
    required this.salary,
  });
}

class Developer extends Employee {
  String level;
  @override
  int work(a, b) {
    // ToDo: implement work
    return a * b;
  }

  Developer(
      {required int id,
      required String name,
      required double salary,
      required this.level})
      : super(
          id: id,
          name: name,
          salary: salary,
        );
  @override
  String toString() {
    //ToDo: implement toString
    return "Managing the team";
  }
}

class Manager extends Employee {
  Manager({
    required int id,
    required String name,
    required double salary,
  }) : super(
          id: id,
          name: name,
          salary: salary,
        );
  @override
  String toString() {
    //ToDo: implement toString
    return "Writing code";
  }
}
