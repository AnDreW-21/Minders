class Person {
  late String name;
  late int age;
  late int phone;
  late int salary;
  late String section;
  late bool isAttend;

  Person(this.name, this.age, this.phone, this.salary, this.section,
      this.isAttend);

  Person.withoutAttendance(
      {required this.name,
      required this.age,
      required this.phone,
      required this.salary,
      required this.section}) {
    isAttend = false;
  }

  @override
  String toString() {
    return "{name: $name ,age: $age ,phone: $phone ,salary: $salary ,section: $section ,attendance: $isAttend}";
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Employee extends Person {
  List<Task> tasks = [];

  Employee(
      String name, int age, int phone, int salary, String sction, bool isAttend)
      : super(name, age, phone, salary, sction, isAttend);

  void addMyTask(Task task) {
    tasks.add(task);
  }

  void printMyTasks() {
    print(tasks);
  }

  void deliverMyTask(Task task) {
    task.changeState();
  }

  @override
  String toString() {
    return "{name: $name ,age: $age ,phone: $phone ,salary: $salary ,section: $section ,attendance: $isAttend ,tasks: $tasks}";
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
class Manger extends Person {
  List<Employee> employees = [];

  Manger(
      String name, int age, int phone, int salary, String sction, bool isAttend)
      : super(name, age, phone, salary, sction, isAttend);

  void printEmployees() {
    for (int i = 0; i < employees.length; i++) {
      print("*" + employees[i].name);
    }
  }

  int numberOfEmployees() {
    return employees.length;
  }

  addEmployee(Employee emp) {
    employees.add(emp);
  }

  void printALLEmployeeDetails() {
    print(employees);
  }

  void addTask(Employee employee, Task task) {
    employee.addMyTask(task);
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
class Task {
  late String name;
  late DateTime date;
  late String deadline;
  late String description;
  late String deliver;

  Task(this.name, this.date, this.deadline, this.description, this.deliver);

  void changeState() {
    deliver = 'Delivered';
  }

  @override
  String toString() {
    return '\n[name: $name ,Date: $date ,Deadline: $deadline ,Description: $description ,Deliver: $deliver]';
  }
}


void main(List<String> arguments) {}
